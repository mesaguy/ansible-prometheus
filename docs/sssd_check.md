# sssd_check

[sssd_check](https://github.com/mesaguy/ansible-prometheus/blob/master/scripts/sssd_check.sh) is a bash script wrapper around the 'sssctl' command and SSSD's ifp interface for monitoring the status of SSSD

[sssd_check](https://github.com/mesaguy/ansible-prometheus/blob/master/scripts/sssd_check.sh) leverages the [textfile directory feature of node_exporter](https://github.com/prometheus/node_exporter#textfile-collector)

# Requirements
This script leverages requires a working node_exporter instance and must write data into the node_exporter's textfile directory

- The 'sssctl' command must be installed
- This script must be run as root
- On SSSD 2.x ifp (SSSD InfoPipe responder) must be an enabled service in sssd.conf, see man sssd-ifp (5).
- Distribution specific:
  - On EL, install: sssd-dbus sssd-tools
- A fully functional 'sed' (not busybox, etc)
- Systems with SELinux in enforcing mode will need to add a policy like the following:

    module sssd_check 1.0;

    require {
            type sssd_t;
            type system_cronjob_t;
            class dbus send_msg;
    }

    #============= sssd_t ==============
    allow sssd_t system_cronjob_t:dbus send_msg;

# Features

The features of this script mirror the status capabilities of the 'sssctl' command:
- Identifies if SSSD is online
- Lists the active servers
- Lists the defined servers
- The SSSD configuration file and status is checked and detailed
- Script supports the use of multiple authentication backends (ie: Multiple domains, etc)

# Usage

Help menu (-h):

    Usage: sssd_check.sh [ -hv ]

     Options:
        -h                         Print usage
        -v                         Enable verbose mode (for debugging only)

    Output of non-verbose mode should be written to the node_exporter
    textfiles directory. Example cron job:
        */5 * * * * /opt/prometheus/scripts/sssd_check.sh | sponge /etc/prometheus/node_exporter_textfiles/sssd_check.prom

[Ideally 'sponge' is leveraged](https://github.com/prometheus-community/node-exporter-textfile-collector-scripts), but the following works as well:

    */5 * * * * /opt/prometheus/scripts/sssd_check.sh > /etc/prometheus/node_exporter_textfiles/sssd_check.prom

Sample output from a system using IPA and a single domain:

    # HELP sssd_issues_identified_by_validators Issues identified by validators.
    # TYPE sssd_issues_identified_by_validators gauge
    sssd_issues_identified_by_validators 0
    # HELP sssd_messages_generated_during_configuration_merging Messages generated during configuration merging.
    # TYPE sssd_messages_generated_during_configuration_merging gauge
    sssd_messages_generated_during_configuration_merging 0
    # HELP sssd_used_configuration_snippet_files Used configuration snippet files.
    # TYPE sssd_used_configuration_snippet_files gauge
    sssd_used_configuration_snippet_files 0
    # HELP sssd_status_sssd_example_com Boolean indicating if system is online. Exact state is in the 'sssd_status' label
    # TYPE sssd_status_sssd_example_com gauge
    sssd_online_status_sssd_example_com{sssd_type="IPA",sssd_domain="technerdvana.com",sssd_status="online"} 0
    # HELP sssd_active_server_sssd_example_com Boolean indicating if system is online. Current server is in the 'sssd_active_server' label
    # TYPE sssd_active_server_sssd_example_com gauge
    sssd_active_server_sssd_example_com{sssd_type="IPA",sssd_domain="technerdvana.com",sssd_active_server="ipa2.technerdvana.com"} 1
    # HELP sssd_count_sssd_example_com Count of configured servers.
    # TYPE sssd_count_sssd_example_com gauge
    sssd_server_count_sssd_example_com{sssd_type="IPA",sssd_domain="technerdvana.com"} 3
    # HELP sssd_check_problems Count problems encountered while checking sssd
    # TYPE sssd_check_problems gauge
    sssd_check_problems 0
    # HELP sssd_check_endtime End time in Unix time with microseconds.
    # TYPE sssd_check_endtime gauge
    sssd_check_endtime 1579669082.027
