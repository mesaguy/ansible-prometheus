# Promcron

[promcron](https://github.com/mesaguy/ansible-prometheus/blob/master/templates/promcron.sh.j2) is a bash script for monitoring cron job success and last run time

[promcron](https://github.com/mesaguy/ansible-prometheus/blob/master/templates/promcron.sh.j2) tests are located [here](https://github.com/mesaguy/ansible-prometheus/tree/master/tests/inspec/promcron)

[promcron](https://github.com/mesaguy/ansible-prometheus/blob/master/templates/promcron.sh.j2) leverages the [textfile directory feature of node_exporter](https://github.com/prometheus/node_exporter#textfile-collector)

# Features
- Script automatically leverages sponge if present. If sponge is not present, script writes to a .tmp file in the textfile directory, then copies the resulting .tmp file and overwrites the .prom file. This ensures that the .prom file is always complete when prometheus polls it.
- Script automatically adds two labels to each .prom file.
  - job_type=cron
  - cron_user=*The USER who ran the cron*
- Script can add a description label to describe the cron job
- Script can take custom labels
- Script prefixes each .prom file with ```cron_```

# Usage

Help menu (-h):

    $ promcron -h
    Usage: promcron [ -Dhv ] [ -d DESCRIPTION ] [ -l label_name=LABEL_VALUE ]
                          [ -s USERNAME ] NAME VALUE
    
    NAME and VALUE are required and must be specified after arguments
    
     Options:
        -d                         Optional description
        -D                         Enable dryrun mode
        -h                         Print usage
        -l label_name=label_value  Optionally add specified labels to node_exporter
                                   textfile data (May be specified multiple times)
        -s USERNAME                Optionally Setup textfile directory file
                                   permissions for specified username. Must be run
                                   as root. Run in dryrun mode to inspect changed
        -v                         Enable verbose mode
    
    Basic example creating /opt/prometheus/etc/node_exporter_textfiles/cron_ls_test.prom:
        ls ; /usr/local/bin/promcron ls_test $?

    Example with description and custom labels:
        ls ; /usr/local/bin/promcron -l environment=Production Environment -l test=true -d ls command test ls_test $?

## Basic usage

One starts with a simple cron job that requires monitoring:

    0 0 * * * find /var/app/tmp -mtime +1 -delete

This cron job can be monitored as simply as:

    0 0 * * * find /var/app/tmp -mtime +1 -delete; promcron daily_delete_app_tmp $?

The following node_exporter textfile .prom file is created:

    $ cat /etc/prometheus/node_exporter_textfiles/cron_daily_delete_app_tmp.prom 
    # HELP cron_daily_delete_app_tmp_endtime Unix time in microseconds.
    # TYPE cron_daily_delete_app_tmp_endtime gauge
    cron_daily_delete_app_tmp_endtime{user="root",job_type="cron_time"} 1578897540129
    # HELP cron_daily_delete_app_tmp Process return code.
    # TYPE cron_daily_delete_app_tmp gauge
    cron_daily_delete_app_tmp{user="root",job_type="cron"} 1

## Advanced usage

Building on the basic usage example above, this example adds a description and a few custom labels
The above example would result in a node_exporter textfile directory file:

    * * * * * find /var/app/tmp -mtime +1 -delete; promcron -l environment=production -l department=tomcat -d "Daily job to delete app tmp files older than 1 day" daily_delete_app_tmp $?

The resulting .prom file is created:

    $ cat /etc/prometheus/node_exporter_textfiles/cron_daily_delete_app_tmp.prom 
    # HELP cron_daily_delete_app_tmp_endtime Unix time in microseconds.
    # TYPE cron_daily_delete_app_tmp_endtime gauge
    cron_daily_delete_app_tmp_endtime{environment="production",department="tomcat",user="root",description="Daily job to delete app tmp files older than 1 day",job_type="cron_time"} 1578897616823
    # HELP cron_daily_delete_app_tmp Process return code.
    # TYPE cron_daily_delete_app_tmp gauge
    cron_daily_delete_app_tmp{environment="production",department="tomcat",user="root",description="Daily job to delete app tmp files older than 1 day",job_type="cron"} 1

## Setup use by non-privileged user

By default, the Prometheus node_exporter textfiles directory cannot be written to by non-privileged users. The permissions can be altered to allow non-privileged users to write to the textfiles directory or the destination files can be created with the correct permissions in advance.

To allow user 'app' to run the following cron job:

    0 0 * * * find /var/app/tmp -mtime +1 -delete; promcron daily_delete_app_tmp $?

Run the following as root to create the resulting files with the correct permissions:

    promcron -s app daily_delete_app_tmp

Root can see what will occur by running:

    # promcron -D -s app daily_delete_app_tmp
    [DRYRUN] touch "/opt/prometheus/etc/node_exporter_textfiles/cron_daily_delete_app_tmp.prom" && chown app "/opt/prometheus/etc/node_exporter_textfiles/cron_daily_delete_app_tmp.prom"

# Installation

[promcron](https://github.com/mesaguy/ansible-prometheus/blob/master/templates/promcron.sh.j2) can be downloaded and used as is. The TEXTFILE_DIRECTORY variable near the top may need to be changed to match your environment.

[promcron](https://github.com/mesaguy/ansible-prometheus/blob/master/templates/promcron.sh.j2) can be installed via the mesaguy/ansible-prometheus module using the following parameter:

    prometheus_install_promcron: true

The installation location defaults to /usr/local/bin, but the destination can be overridden using the 'prometheus_promcron_install_dir' parameter:

    prometheus_promcron_install_dir: /usr/local/bin

# Alerting

All Prometheus monitored cron jobs can be seen by leveraging the following query:

    {job_type=~"cron"}
