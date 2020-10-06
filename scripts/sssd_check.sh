#!/bin/bash

# "sssd_check" leverages the sssctl interface to determine SSSD's health

# "sssd_check" is a wrapper around the 'sssctl' command and SSSD's ifp
# interface. The SSSD configuration file and status is checked and detailed.
# Script supports the use of multiple authentication backends (ie: Multiple
# domains, etc)

# Author: MesaGuy (https://github.com/mesaguy)
# Documentation: https://github.com/mesaguy/ansible-prometheus/blob/master/docs/promcron.md
# Source: https://github.com/mesaguy/ansible-prometheus/blockmaster/scripts/sssd_check.sh
# License: MIT
# Version: 0.3 (2020-01-23)

MAX_RETRIES=5
PROBLEM_COUNT=0

# Set USER variable if undefined
if [ -z "$USER" ] ; then
    USER=$(whoami)
fi

function usage () {
    echo "Usage: $(basename $0) [ -hv ]"
    echo
    echo " Options:"
    echo "    -h                         Print usage"
    echo "    -v                         Enable verbose mode (for debugging only)"
    echo
    echo "Output of non-verbose mode should be written to the node_exporter"
    echo "textfiles directory. Example cron job:"
    echo "    */5 * * * * /opt/prometheus/scripts/sssd_check.sh | sponge /etc/prometheus/node_exporter_textfiles/sssd_check.prom"
    echo
    exit 1
}

# Add /usr/sbin to PATH if not present, this is often where sssctl is found
if [[ ! $PATH =~ ^.*\/usr\/sbin.*$ ]] ; then
    PATH="${PATH}:/usr/sbin"
fi

while getopts "hv" option; do
    case ${option} in
        h)
            usage
            ;;
        v)
            VERBOSE="1"
            ;;
        \?)
            usage
            ;;
    esac
done

if [ "$USER" != "root" ] ; then
    echo "$(basename $0) must be run as root!"
    exit 2
fi

# sssctl config-check
if [ -n "$VERBOSE" ] ; then
    echo "---> sssctl config-check"
fi
CONFIG_CHECK=$(sssctl config-check | sed -e '/^\s*$/d' -e 's/\ /_/g')
if [ "$?" -ne "0" ] ; then
    PROBLEM_COUNT=$((PROBLEM_COUNT + 1))
fi
for ENTRY in $(echo -e "$CONFIG_CHECK")
do
    DESC=$(echo -n $ENTRY | sed -e 's/_/ /g' -e 's/\:.*//')
    METRIC_NAME=$(echo -n ${ENTRY} | sed -e 's/\(.*\)/sssd_\L\1/' -e 's/\:.*//')
    echo "# HELP $METRIC_NAME ${DESC}."
    echo "# TYPE $METRIC_NAME gauge"
    echo "$ENTRY" | sed -e 's/\(.*\)/sssd_\L\1/' -e 's/:_/ /g'
done

RETRIES=0
until [ $RETRIES -eq $MAX_RETRIES ] || DOMAIN_LIST=$(timeout 10s sssctl domain-list) ; do
        sleep $((RETRIES++))
done
if [ $RETRIES -eq $MAX_RETRIES ] ; then
    echo "Error getting domain list after $MAX_RETRIES retries, exiting!" >&2
    echo sss_check_problems 1
    exit 1
fi

for domain in $DOMAIN_LIST
do
    # Domain metric suffix
    DMS=$(echo $domain | sed -e 's/\(.*\)/sssd_\L\1/' -e 's/\./_/g')
    ACTIVE_SERVERS=$(sssctl domain-status $domain --active-server | sed -e '1d' -e 's/\ //g' -e '/^\s*$/d')
    ACTIVE_SERVER_COUNT=$(echo -e "$ACTIVE_SERVERS" | wc -l)
    for server_class in "$ACTIVE_SERVERS"
    do
        IFS=: read server_type server_name <<< $server_class
        if [ -n "$VERBOSE" ] ; then
            echo "---> sssctl domain-status $domain --online"
        fi
        STATUS=$(sssctl domain-status $domain --online)
        if [ "$?" -ne "0" ] ; then
            PROBLEM_COUNT=$((PROBLEM_COUNT + 1))
        fi
        echo "# HELP sssd_status_${DMS} Boolean indicating if system is online. Exact state is in the 'sssd_status' label"
        echo "# TYPE sssd_status_${DMS} gauge"
        echo -en "$STATUS" | sed -e '/^\s*$/d' -e 's/\(.*\)/sssd_\L\1/' -e 's/\ /_/g' -e "s/:_/_${DMS}{sssd_type=\"$server_type\",sssd_domain=\"$domain\",sssd_status=\"/g" -e 's/$/"} /'
        if [[ $STATUS =~ ^.*Online$ ]] ; then
            echo 0
        else
            echo 1
        fi
        echo "# HELP sssd_active_server_${DMS} Boolean indicating if system is online. Current server is in the 'sssd_active_server' label"
        echo "# TYPE sssd_active_server_${DMS} gauge"
        echo "sssd_active_server_${DMS}{sssd_type=\"$server_type\",sssd_domain=\"$domain\",sssd_active_server=\"$server_name\"} $ACTIVE_SERVER_COUNT"
        if [ -n "$VERBOSE" ] ; then
            echo "---> sssctl domain-status $domain --servers"
        fi
        COUNT=$(sssctl domain-status $domain --servers | sed -e "/^.*${server_type}.*$/,/^$/!d;/^$/d;/^.*${server_type}.*$/d" | wc -l)
        if [ "${PIPESTATUS[0]}" -ne "0" ] ; then
            PROBLEM_COUNT=$((PROBLEM_COUNT + 1))
        fi
        echo "# HELP sssd_count_${DMS} Count of configured servers."
        echo "# TYPE sssd_count_${DMS} gauge"
        echo "sssd_server_count_${DMS}{sssd_type=\"$server_type\",sssd_domain=\"$domain\"} $COUNT"
    done
done
echo "# HELP sssd_check_problems Count problems encountered while checking sssd"
echo "# TYPE sssd_check_problems gauge"
echo sssd_check_problems $PROBLEM_COUNT

printf "# HELP sssd_check_endtime End time in Unix time with microseconds.
# TYPE sssd_check_endtime gauge
sssd_check_endtime $(date +%s.%3N)\n"

if [ "$PROBLEM_COUNT" -ne "0" ] ; then
    exit 1
fi
exit 0
