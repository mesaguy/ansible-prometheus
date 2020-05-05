# Promcron

[promcron](https://github.com/mesaguy/ansible-prometheus/blob/master/scripts/promcron.sh) is a bash script for monitoring cron job success and last run time

[promcron](https://github.com/mesaguy/ansible-prometheus/blob/master/scripts/promcron.sh) pre-release validation tests are located [here](https://github.com/mesaguy/ansible-prometheus/tree/master/tests/inspec/promcron)

[promcron](https://github.com/mesaguy/ansible-prometheus/blob/master/scripts/promcron.sh) leverages the [textfile directory feature of node_exporter](https://github.com/prometheus/node_exporter#textfile-collector)

# Requirements
- This script leverages requires a working node_exporter instance and must write data into the node_exporter's textfile directory
- The defined "TEXTFILE_DIRECTORY" parameter should match your node_exporter textfile directory path
- A fully functional 'sed' (not busybox, etc)

# Features
- Script automatically leverages sponge if present. If sponge is not present, script writes to a .tmp file in the textfile directory, then copies the resulting .tmp file and overwrites the .prom file. This ensures that the .prom file is always complete when prometheus polls the node_exporter instance.
- Script automatically adds two labels to each .prom file.
  - promcron="endtime" or promcron="value"
  - user="CRON_USER"
- Script can add a description label to describe the cron job
- Script can take custom labels
- Script prefixes each .prom file with ```cron_```
- Exits returning the 'value' given to it. This is useful is additional shell logic follows running promcron.
- Leverages 'sponge' if present

# Usage

Help menu (-h):

    Usage: promcron.sh [ -Dhv ] [ -d DESCRIPTION ] [ -i IDENTIFIER ]
                          [ -l label_name=LABEL_VALUE ] [ -s USERNAME ] NAME VALUE

    NAME and VALUE are required and must be specified after arguments

     Options:
        -d "LONG DESCRIPTION"      Optional description
        -D                         Enable dryrun mode
        -h                         Print usage
        -i IDENTIFIER              Output identifier, needed when multiple jobs
                                   have the same name, but have different labels
        -l label_name=label_value  Optionally add specified labels to node_exporter
                                   textfile data (May be specified multiple times)
        -s USERNAME                Optionally Setup textfile directory file
                                   permissions for specified username. Must be run
                                   as root. Run in dryrun mode to inspect changed
        -t DIRECTORY               Specify a textfiles directory (Defaults
                                   to: /etc/prometheus/node_exporter_textfiles)
        -v                         Enable verbose mode

    Basic example creating /etc/prometheus/node_exporter_textfiles/cron_ls_test.prom:
    * * * * *    ls ; promcron.sh ls_test $?

    Example with description and custom labels:
    * * * * *    ls ; promcron.sh -l environment="Production Environment" -l test=true -d "ls command test" ls_test $?

## Basic usage

One starts with a simple cron job that requires monitoring:

    0 0 * * * find /var/app/tmp -mtime +1 -delete

This cron job can be monitored as simply as:

    0 0 * * * find /var/app/tmp -mtime +1 -delete; promcron daily_delete_app_tmp $?

The following node_exporter textfile .prom file is created:

    # HELP cron_test_endtime Unix time in microseconds.
    # TYPE cron_test_endtime gauge
    cron_test_endtime{user="root",description="Copy bank files",promcron="endtime"} 1579669082.027
    # HELP cron_test Process return code.
    # TYPE cron_test gauge
    cron_test{user="root",description="Copy bank files",promcron="value"} 0

## Advanced usage

Building on the basic usage example above, this example adds a description and a few custom labels
The above example would result in a node_exporter textfile directory file:

    * * * * * find /var/app/tmp -mtime +1 -delete; promcron -l environment=production -l application=tomcat -d "Daily job to delete app tmp files older than 1 day" daily_delete_app_tmp $?

The resulting .prom file is created:

    # HELP cron_daily_delete_app_tmp_endtime Unix time in microseconds.
    # TYPE cron_daily_delete_app_tmp_endtime gauge
    cron_daily_delete_app_tmp_endtime{environment="production",application="tomcat",user="root",description="Daily job to delete app tmp files older than 1 day",promcron="endtime"} 1579669484.929
    # HELP cron_daily_delete_app_tmp Process return code.
    # TYPE cron_daily_delete_app_tmp gauge
    cron_daily_delete_app_tmp{environment="production",application="tomcat",user="root",description="Daily job to delete app tmp files older than 1 day",promcron="value"} 0

If one script will be used in numerous ways, each instance can have an identifier set as follows:

    backup host1 ; promcron -i host1 -l backup=host1 backup $?
    backup host2 ; promcron -i host2 -l backup=host2 backup $?

The following files will result, each with its own labels:

    /opt/prometheus/etc/node_exporter_textfiles/cron_backup.host1.prom
    /opt/prometheus/etc/node_exporter_textfiles/cron_backup.host2.prom

## Setup use by non-privileged user

By default, the Prometheus node_exporter textfiles directory cannot be written to by non-privileged users. The permissions can be altered to allow non-privileged users to write to the textfiles directory or the destination files can be created with the correct permissions in advance.

To allow user 'app' to run the following cron job:

    0 0 * * * find /var/app/tmp -mtime +1 -delete; promcron daily_delete_app_tmp $?

Run the following as root to create the resulting files with the correct permissions:

    promcron -s app daily_delete_app_tmp

Root can see what will occur by running:

    # promcron -D -s app  daily_delete_app_tmp
    [DRYRUN] touch "/opt/prometheus/etc/node_exporter_textfiles/cron_daily_delete_app_tmp.prom" && chown app "/opt/prometheus/etc/node_exporter_textfiles/cron_daily_delete_app_tmp.prom"

# Installation

[promcron](https://github.com/mesaguy/ansible-prometheus/blob/master/scripts/promcron.sh) can be downloaded and used as is. The TEXTFILE_DIRECTORY variable near the top may need to be changed to match your environment.

[promcron](https://github.com/mesaguy/ansible-prometheus/blob/master/scripts/promcron.sh) can be installed via the [mesaguy/prometheus](https://galaxy.ansible.com/mesaguy/prometheus) Ansible role using the following parameter:

    prometheus_script_promcron: true

The installation location defaults to /usr/local/bin, but the destination can be overridden using the 'prometheus_promcron_install_dir' parameter:

    prometheus_promcron_install_dir: /usr/local/bin

# Alerting

All Prometheus monitored cron jobs can be seen by leveraging one of the following queries:

    {promcron=~"value"}

or

    {promcron=~"endtime"}

An alert for the cronjob ```@weekly /sbin/mdadm --monitor --scan -1 --test; promcron -d "Test and scan mdadm weekly" mdadm_weekly_test $?``` could be configured as follows:

    - alert: mdadm weekly test is not running
      expr: (time() - cron_mdadm_weekly_test_endtime) / 86400 > 7
      for: 1m
      labels:
        severity: warning
      annotations:
        description: mdadm weekly test has not run in over {{ $value }} days.
        summary: mdadm weekly test is not running

The following sends an alerts if *any* cronjob doesn't return '0'. In this example, if a failing promcron script is retired, its node_exporter textfiles directory *.prom file must be deleted to stop alerting:

    - alert: Failing cron job
      expr: |
        {__name__=~'.*', promcron='value'} != 0
      for: 1m
      labels:
        severity: warning
      annotations:
        description: Cron of {{ $labels.user }} on {{ $labels.instance }} is failing.
        summary: Cron job is failing

The following sends and alert if the 'backup' cron job is failing, example assumes 'backup' cronjob has a description configued (-d):

    - alert: Backup cron job is failing
      expr: cron_backup != 0
      for: 1m
      labels:
        severity: warning
      annotations:
        description: Backup of "{{ $labels.description }}" of {{ $labels.user }} on {{ $labels.instance }} is failing.
        summary: Backup is failing
