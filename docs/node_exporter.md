# Node exporter configuration

To enable [node_exporter](https://github.com/prometheus/node_exporter) include role task: node_exporter

Numerous [node_exporter textfiles scripts](#supported-node-exporter-textfiles-scripts) can be installed by enabling the specified script specific variables.

The directory node_exporter should poll for text files containing additional information to present. Defaults to '/opt/prometheus/etc/node_exporter_textfiles':

    prometheus_node_exporter_textfiles_directory: '/opt/prometheus/etc/node_exporter_textfiles'

An array of additional flags to pass to the node_exporter daemon. You will likely wish to customize the data collected by [node_exporter](https://github.com/prometheus/node_exporter) by adding flags here:

    prometheus_node_exporter_extra_opts: []

Common node_exporter variables can be defined as follows:

    prometheus_node_exporter_extra_opts:
      - '--collector.filesystem.ignored-mount-points="^/(sys|proc|dev|run|var/lib/docker/.*)($|/)"'
      - '--collector.systemd'
      - '--no-collector.zfs'

The version of node_exporter to install. The default version can be found in the [node_exporter variables file](../vars/software/node_exporter.yml) and the default version can be overridden using the following variable:

    prometheus_node_exporter_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_node_exporter_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9100:

    prometheus_node_exporter_host: "0.0.0.0"
    prometheus_node_exporter_port: 9100

Node exporter textfiles scripts can be installed into the 'prometheus_script_directory' directory (/opt/prometheus/scripts by default) using the following parameters:

    prometheus_script_directory: '/opt/prometheus/scripts'
    # S.M.A.R.T. monitoring script
    prometheus_script_smartmon: true

Purge textfiles older than 'prometheus_node_exporter_textfile_max_age' days (Default: 14d). Option 'prometheus_node_exporter_textfile_purge' defaults to 'false':

    prometheus_node_exporter_textfile_purge: true
    prometheus_node_exporter_textfile_max_age: 14d

Node exporter textfiles scripts will generally need to be run via cron and ideally via [sponge](https://github.com/prometheus-community/node-exporter-textfile-collector-scripts/blob/master/README.md), for instance:

    hosts: prometheus_clients
    vars:
      prometheus_components:
       - node_exporter
      prometheus_script_directory: /opt/prometheus/scripts'
      prometheus_script_smartmon: true
      prometheus_node_exporter_textfiles_directory: /opt/prometheus/etc/node_exporter_textfiles
    roles:
      - mesaguy.prometheus
    tasks:
      - name: Setup cron job to run smartmon.sh
        become: true
        copy:
          dest: /etc/cron.d/smartmon
          # Requires 'sponge' be installed:
          content: "*/5 * * * * root bash {{ prometheus_script_directory }}/smartmon.sh | sponge {{ prometheus_node_exporter_textfiles_directory }}/smartmon.prom\n"
          mode: 0555
          owner: root
          group: root
