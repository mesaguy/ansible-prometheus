# Promrun

[promrun](https://github.com/mesaguy/ansible-prometheus/blob/master/scripts/promrun.sh) is a bash script wrapper around the GNU 'time' command useful for monitoring the timing, success, and resource utilization of commands

[promrun](https://github.com/mesaguy/ansible-prometheus/blob/master/scripts/promrun.sh) pre-release validation tests are located [here](https://github.com/mesaguy/ansible-prometheus/tree/master/tests/inspec/promrun)

[promrun](https://github.com/mesaguy/ansible-prometheus/blob/master/scripts/promrun.sh) leverages the [textfile directory feature of node_exporter](https://github.com/prometheus/node_exporter#textfile-collector)

# Requirements
- This script leverages requires a working node_exporter instance and must write data into the node_exporter's textfile directory
- The defined "TEXTFILE_DIRECTORY" parameter should match your node_exporter textfile directory path
- GNU time must be installed. Bash's built in 'time' command is not sufficient.
- A fully functional 'sed' (not busybox, etc)

# Features

- Leverages 'sponge' if present
- Utilizes the 'time' command to collect resource utilization stats
- Provides start and end times
- Provides total duration time

# Usage

Help menu (-h):

    Usage: promrun.sh [ -Dhv ] [ -d DESCRIPTION ] [ -i IDENTIFIER ]
                          [ -l label_name=LABEL_VALUE ] [ -n NAME ]
                          [ -s USERNAME ] COMMAND

    NAME (-n) and COMMAND are required and must be specified after arguments

     Options:
        -d "LONG DESCRIPTION"      Optional description
        -D                         Enable dryrun mode
        -h                         Print usage
        -i IDENTIFIER              Output identifier, needed when multiple jobs
                                   have the same name, but have different labels
        -l label_name=label_value  Optionally add specified labels to node_exporter
                                   textfile data (May be specified multiple times)
        -n NAME                    Required metric name suffix, all metrics are
                                   prefixed with 'promrun_'
        -s USERNAME                Optionally Setup textfile directory file
                                   permissions for specified username. Must be run
                                   as root. Run in dryrun mode to inspect changed
        -t DIRECTORY               Specify a textfiles directory (Defaults
                                   to: /etc/prometheus/node_exporter_textfiles)
        -v                         Enable verbose mode

    Basic example creating /etc/prometheus/node_exporter_textfiles/promrun_ls_test.prom:
    promrun.sh -n ls_test ls

    Example with description and custom labels:
    promrun.sh -n ls_test -l environment="Production Environment" -l test=true -d "ls command test" ls

## Basic usage

One starts with a simple scripted, nested script, or cron job that requires monitoring:

    dd if=/dev/sda1 of=/tmp/test bs=1M count=1024

This job can be monitored as simply as:

    promrun -n dd_test dd if=/dev/sda1 of=/tmp/test bs=1M count=1024

The following node_exporter textfile .prom file is created:

    # HELP promrun_dd_test_starttime Start time in Unix time with microseconds.
    # TYPE promrun_dd_test_starttime gauge
    promrun_dd_test_starttime{user="root",promrun="starttime"} 1579841779.118
    # HELP promrun_dd_test_cpu_kernel_mode_seconds Total number of CPU-seconds that the process spent in kernel mode.
    # TYPE promrun_dd_test_cpu_kernel_mode_seconds gauge
    promrun_dd_test_cpu_kernel_mode_seconds{user="root"} 0.63
    # HELP promrun_dd_test_elapsed_seconds Elapsed real time (in seconds).
    # TYPE promrun_dd_test_elapsed_seconds gauge
    promrun_dd_test_elapsed_seconds{user="root"} 1.82
    # HELP promrun_dd_test_cpu_user_mode_seconds Total number of CPU-seconds that the process spent in user mode.
    # TYPE promrun_dd_test_cpu_user_mode_seconds gauge
    promrun_dd_test_cpu_user_mode_seconds{user="root"} 0.00
    # HELP promrun_dd_test_max_resident_memory_kb Maximum resident set size of the process during its lifetime, in Kbytes.
    # TYPE promrun_dd_test_max_resident_memory_kb gauge
    promrun_dd_test_max_resident_memory_kb{user="root"} 3136
    # HELP promrun_dd_test_avg_total_memory_kb Average total (data+stack+text) memory use of the process, in Kbytes.
    # TYPE promrun_dd_test_avg_total_memory_kb gauge
    promrun_dd_test_avg_total_memory_kb{user="root"} 0
    # HELP promrun_dd_test_swapped_from_main_memory_count Number of times the process was swapped out of main memory.
    # TYPE promrun_dd_test_swapped_from_main_memory_count gauge
    promrun_dd_test_swapped_from_main_memory_count{user="root"} 0
    # HELP promrun_dd_test_signals_delivered_to_process_count Number of signals delivered to the process.
    # TYPE promrun_dd_test_signals_delivered_to_process_count gauge
    promrun_dd_test_signals_delivered_to_process_count{user="root"} 0
    # HELP promrun_dd_test_context_switch_count_involuntary_count Number of times the process was context-switched involuntarily (because the time slice expired).
    # TYPE promrun_dd_test_context_switch_count_involuntary_count gauge
    promrun_dd_test_context_switch_count_involuntary_count{user="root"} 213
    # HELP promrun_dd_test_context_switch_count_voluntary_count Number of waits, times that the program was context-switched voluntarily, for instance while waiting for an I/O operation to complete.
    # TYPE promrun_dd_test_context_switch_count_voluntary_count gauge
    promrun_dd_test_context_switch_count_voluntary_count{user="root"} 822
    # HELP promrun_dd_test_filesystem_inputs_count Number of filesystem inputs by the process.
    # TYPE promrun_dd_test_filesystem_inputs_count gauge
    promrun_dd_test_filesystem_inputs_count{user="root"} 169672
    # HELP promrun_dd_test_filesystem_outputs_count Number of filesystem outputs by the process.
    # TYPE promrun_dd_test_filesystem_outputs_count gauge
    promrun_dd_test_filesystem_outputs_count{user="root"} 499712
    # HELP promrun_dd_test_socket_messages_received_count Number of socket messages received by the process.
    # TYPE promrun_dd_test_socket_messages_received_count gauge
    promrun_dd_test_socket_messages_received_count{user="root"} 0
    # HELP promrun_dd_test_socket_messages_sent_count Number of socket messages sent by the process.
    # TYPE promrun_dd_test_socket_messages_sent_count gauge
    promrun_dd_test_socket_messages_sent_count{user="root"} 0
    # HELP promrun_dd_test_exit_status Exit status of the command.
    # TYPE promrun_dd_test_exit_status gauge
    promrun_dd_test_exit_status{user="root",promrun="exit"} 0
    # HELP promrun_dd_test_process_avg_size_resident_set_kb Average resident set size of the process, in Kbytes.
    # TYPE promrun_dd_test_process_avg_size_resident_set_kb gauge
    promrun_dd_test_process_avg_size_resident_set_kb{user="root"} 0
    # HELP promrun_dd_test_process_avg_size_unshared_data_area_kb Average size of the process's unshared data area, in Kbytes.
    # TYPE promrun_dd_test_process_avg_size_unshared_data_area_kb gauge
    promrun_dd_test_process_avg_size_unshared_data_area_kb{user="root"} 0
    # HELP promrun_dd_test_process_avg_size_unshared_stack_space_kb Average size of the process's unshared stack space, in Kbytes.
    # TYPE promrun_dd_test_process_avg_size_unshared_stack_space_kb gauge
    promrun_dd_test_process_avg_size_unshared_stack_space_kb{user="root"} 0
    # HELP promrun_dd_test_process_avg_size_shared_text_space_kb Average size of the process's shared text space, in Kbytes.
    # TYPE promrun_dd_test_process_avg_size_shared_text_space_kb gauge
    promrun_dd_test_process_avg_size_shared_text_space_kb{user="root"} 0
    # HELP promrun_dd_test_major_page_fault_count Number of major page faults that occurred while the process was running. These are faults where the page has to be read in from disk.
    # TYPE promrun_dd_test_major_page_fault_count gauge
    promrun_dd_test_major_page_fault_count{user="root"} 0
    # HELP promrun_dd_test_minor_page_fault_count Number of minor, or recoverable, page faults. These are faults for pages that are not valid but which have not yet been claimed by other virtual pages. Thus the data in the page is still valid but the system tables must be updated.
    # TYPE promrun_dd_test_minor_page_fault_count gauge
    promrun_dd_test_minor_page_fault_count{user="root"} 339
    # HELP promrun_dd_test_command Name and command-line arguments of the command being timed. See Label.
    # TYPE promrun_dd_test_command gauge
    promrun_dd_test_command{user="root",command="dd if=/dev/sda1 of=/tmp/test bs=1M count=1024"} 1
    # HELP promrun_dd_test_endtime End time in Unix time with microseconds.
    # TYPE promrun_dd_test_endtime gauge
    promrun_dd_test_endtime{user="root",promrun="endtime"} 1579841780.956


## Advanced usage

Building on the basic usage example above, this example adds a description and a few custom labels
The above example would result in a node_exporter textfile directory file:

    promrun -l environment=production -l application=tomcat -d "Job to benchmark disk performance" -n dd_test dd if=/dev/sda1 of=/tmp/test bs=1M count=1024

The resulting .prom file is created:

    # HELP promrun_dd_test_starttime Start time in Unix time with microseconds.
    # TYPE promrun_dd_test_starttime gauge
    promrun_dd_test_starttime{environment="production",application="tomcat",user="root",description="Job to benchmark disk performance",promrun="starttime"} 1579841857.122
    # HELP promrun_dd_test_cpu_kernel_mode_seconds Total number of CPU-seconds that the process spent in kernel mode.
    # TYPE promrun_dd_test_cpu_kernel_mode_seconds gauge
    promrun_dd_test_cpu_kernel_mode_seconds{environment="production",application="tomcat",user="root",description="Job to benchmark disk performance"} 0.52
    # HELP promrun_dd_test_elapsed_seconds Elapsed real time (in seconds).
    # TYPE promrun_dd_test_elapsed_seconds gauge
    promrun_dd_test_elapsed_seconds{environment="production",application="tomcat",user="root",description="Job to benchmark disk performance"} 0.76
    # HELP promrun_dd_test_cpu_user_mode_seconds Total number of CPU-seconds that the process spent in user mode.
    # TYPE promrun_dd_test_cpu_user_mode_seconds gauge
    promrun_dd_test_cpu_user_mode_seconds{environment="production",application="tomcat",user="root",description="Job to benchmark disk performance"} 0.00
    # HELP promrun_dd_test_max_resident_memory_kb Maximum resident set size of the process during its lifetime, in Kbytes.
    # TYPE promrun_dd_test_max_resident_memory_kb gauge
    promrun_dd_test_max_resident_memory_kb{environment="production",application="tomcat",user="root",description="Job to benchmark disk performance"} 3068
    # HELP promrun_dd_test_avg_total_memory_kb Average total (data+stack+text) memory use of the process, in Kbytes.
    # TYPE promrun_dd_test_avg_total_memory_kb gauge
    promrun_dd_test_avg_total_memory_kb{environment="production",application="tomcat",user="root",description="Job to benchmark disk performance"} 0
    # HELP promrun_dd_test_swapped_from_main_memory_count Number of times the process was swapped out of main memory.
    # TYPE promrun_dd_test_swapped_from_main_memory_count gauge
    promrun_dd_test_swapped_from_main_memory_count{environment="production",application="tomcat",user="root",description="Job to benchmark disk performance"} 0
    # HELP promrun_dd_test_signals_delivered_to_process_count Number of signals delivered to the process.
    # TYPE promrun_dd_test_signals_delivered_to_process_count gauge
    promrun_dd_test_signals_delivered_to_process_count{environment="production",application="tomcat",user="root",description="Job to benchmark disk performance"} 0
    # HELP promrun_dd_test_context_switch_count_involuntary_count Number of times the process was context-switched involuntarily (because the time slice expired).
    # TYPE promrun_dd_test_context_switch_count_involuntary_count gauge
    promrun_dd_test_context_switch_count_involuntary_count{environment="production",application="tomcat",user="root",description="Job to benchmark disk performance"} 125
    # HELP promrun_dd_test_context_switch_count_voluntary_count Number of waits, times that the program was context-switched voluntarily, for instance while waiting for an I/O operation to complete.
    # TYPE promrun_dd_test_context_switch_count_voluntary_count gauge
    promrun_dd_test_context_switch_count_voluntary_count{environment="production",application="tomcat",user="root",description="Job to benchmark disk performance"} 5
    # HELP promrun_dd_test_filesystem_inputs_count Number of filesystem inputs by the process.
    # TYPE promrun_dd_test_filesystem_inputs_count gauge
    promrun_dd_test_filesystem_inputs_count{environment="production",application="tomcat",user="root",description="Job to benchmark disk performance"} 16
    # HELP promrun_dd_test_filesystem_outputs_count Number of filesystem outputs by the process.
    # TYPE promrun_dd_test_filesystem_outputs_count gauge
    promrun_dd_test_filesystem_outputs_count{environment="production",application="tomcat",user="root",description="Job to benchmark disk performance"} 499712
    # HELP promrun_dd_test_socket_messages_received_count Number of socket messages received by the process.
    # TYPE promrun_dd_test_socket_messages_received_count gauge
    promrun_dd_test_socket_messages_received_count{environment="production",application="tomcat",user="root",description="Job to benchmark disk performance"} 0
    # HELP promrun_dd_test_socket_messages_sent_count Number of socket messages sent by the process.
    # TYPE promrun_dd_test_socket_messages_sent_count gauge
    promrun_dd_test_socket_messages_sent_count{environment="production",application="tomcat",user="root",description="Job to benchmark disk performance"} 0
    # HELP promrun_dd_test_exit_status Exit status of the command.
    # TYPE promrun_dd_test_exit_status gauge
    promrun_dd_test_exit_status{environment="production",application="tomcat",user="root",description="Job to benchmark disk performance",promrun="exit"} 0
    # HELP promrun_dd_test_process_avg_size_resident_set_kb Average resident set size of the process, in Kbytes.
    # TYPE promrun_dd_test_process_avg_size_resident_set_kb gauge
    promrun_dd_test_process_avg_size_resident_set_kb{environment="production",application="tomcat",user="root",description="Job to benchmark disk performance"} 0
    # HELP promrun_dd_test_process_avg_size_unshared_data_area_kb Average size of the process's unshared data area, in Kbytes.
    # TYPE promrun_dd_test_process_avg_size_unshared_data_area_kb gauge
    promrun_dd_test_process_avg_size_unshared_data_area_kb{environment="production",application="tomcat",user="root",description="Job to benchmark disk performance"} 0
    # HELP promrun_dd_test_process_avg_size_unshared_stack_space_kb Average size of the process's unshared stack space, in Kbytes.
    # TYPE promrun_dd_test_process_avg_size_unshared_stack_space_kb gauge
    promrun_dd_test_process_avg_size_unshared_stack_space_kb{environment="production",application="tomcat",user="root",description="Job to benchmark disk performance"} 0
    # HELP promrun_dd_test_process_avg_size_shared_text_space_kb Average size of the process's shared text space, in Kbytes.
    # TYPE promrun_dd_test_process_avg_size_shared_text_space_kb gauge
    promrun_dd_test_process_avg_size_shared_text_space_kb{environment="production",application="tomcat",user="root",description="Job to benchmark disk performance"} 0
    # HELP promrun_dd_test_major_page_fault_count Number of major page faults that occurred while the process was running. These are faults where the page has to be read in from disk.
    # TYPE promrun_dd_test_major_page_fault_count gauge
    promrun_dd_test_major_page_fault_count{environment="production",application="tomcat",user="root",description="Job to benchmark disk performance"} 0
    # HELP promrun_dd_test_minor_page_fault_count Number of minor, or recoverable, page faults. These are faults for pages that are not valid but which have not yet been claimed by other virtual pages. Thus the data in the page is still valid but the system tables must be updated.
    # TYPE promrun_dd_test_minor_page_fault_count gauge
    promrun_dd_test_minor_page_fault_count{environment="production",application="tomcat",user="root",description="Job to benchmark disk performance"} 339
    # HELP promrun_dd_test_command Name and command-line arguments of the command being timed. See Label.
    # TYPE promrun_dd_test_command gauge
    promrun_dd_test_command{environment="production",application="tomcat",user="root",description="Job to benchmark disk performance",command="dd if=/dev/sda1 of=/tmp/test bs=1M count=1024"} 1
    # HELP promrun_dd_test_endtime End time in Unix time with microseconds.
    # TYPE promrun_dd_test_endtime gauge
    promrun_dd_test_endtime{environment="production",application="tomcat",user="root",description="Job to benchmark disk performance",promrun="endtime"} 1579841857.931

promrun can also be used with pipes to monitor and generate metrics for numerous steps. Example:

    promrun -n manjaro_arm_image_extract xzcat Manjaro-ARM-minimal-rpi4-19.08.img.xz | \
    promrun -n manjaro_arm_image_write dd of=/dev/sdb conv=fsync oflag=sync bs=4M

A script could call promrun numerous times as follows:

    #!/bin/bash

    promrun -n backup_database ./backup_database
    promrun -n prune_backups ./prune_backups

If one script will be used in numerous ways, each instance can have an identifier set as follows:

    promrun -i host1 -l backup=host1 -n backup ./backup host1
    promrun -i host2 -l backup=host2 -n backup ./backup host2

The following files will result, each with its own labels:

    /opt/prometheus/etc/node_exporter_textfiles/promrun_backup.host1.prom
    /opt/prometheus/etc/node_exporter_textfiles/promrun_backup.host2.prom

## Setup use by non-privileged user

By default, the Prometheus node_exporter textfiles directory cannot be written to by non-privileged users. The permissions can be altered to allow non-privileged users to write to the textfiles directory or the destination files can be created with the correct permissions in advance.

To allow user 'app' to run the following cron job:

    0 0 * * * promrun -n daily_delete_app_tmp find /var/app/tmp -mtime +1

Run the following as root to create the resulting files with the correct permissions:

    promrun -s app -n daily_delete_app_tmp

Root can see what will occur by running:

    # promrun -D -s app -n daily_delete_app_tmp
    [DRYRUN] touch "/opt/prometheus/etc/node_exporter_textfiles/promrun_daily_delete_app_tmp.prom" "/opt/prometheus/etc/node_exporter_textfiles/promrun_daily_delete_app_tmp.prom.tmp" && chown app "/opt/prometheus/etc/node_exporter_textfiles/promrun_daily_delete_app_tmp.prom" "/opt/prometheus/etc/node_exporter_textfiles/promrun_daily_delete_app_tmp.prom.tmp"

# Installation
[promrun](https://github.com/mesaguy/ansible-prometheus/blob/master/scripts/promrun.sh) can be installed via the [mesaguy/prometheus](https://galaxy.ansible.com/mesaguy/prometheus) Ansible role using the following parameter:

    prometheus_script_promrun: true

The installation location defaults to /usr/local/bin, but the destination can be overridden using the 'prometheus_promrun_install_dir' parameter:

    prometheus_promrun_install_dir: /usr/local/bin

# Alerting

The following sends an alert if the 'permissions_repair' job hasn't run in 3 days:

    - alert: Permissions repair job is not running
      expr: (time() - promrun_permissions_repair_endtime) / 86400 > 3
      for: 1m
      labels:
        severity: warning
      annotations:
        description: Permissions repair job has not run in{{ $value }} days.
        summary: Permissions repair job not running

The following sends an alerts if *any* cronjob (other than 'promrun_backup_laptops') doesn't return '0':

    - alert: Failing promrun job
      expr: |
        {__name__!~'(promrun_backup_laptops)', promrun='exit'} != 0
      for: 1m
      labels:
        severity: warning
      annotations:
        description: Promrun {{ $labels.user }} on {{ $labels.instance }} is failing.
        summary: Promrun job is failing
