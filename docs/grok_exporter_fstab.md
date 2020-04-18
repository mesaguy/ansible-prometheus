# Grok exporter (fstab) configuration

To enable [grok_exporter by fstab](https://github.com/fstab/grok_exporter) include role task: grok_exporter_fstab

The configuration content. The example below utilizes a file named 'grok_exporter_fstab.yml' in your Ansible root directory's 'files' directory. If no configuration content is defined, a default configuration file is utilized. You will want to customize your configuration file content!:

    prometheus_grok_exporter_fstab_cfg: '{{ lookup("file", "../files/grok_exporter_fstab.yml") | from_yaml }}'

Alternatively, the configuration file can be defined directly:

    prometheus_grok_exporter_fstab_cfg:
      global:
          config_version: 2
      input:
          type: file
          path: ./example/example.log
          readall: true
      grok:
          patterns_dir: ./logstash-patterns-core/patterns
      metrics:
          - type: counter
            name: grok_example_lines_total
            help: Counter metric example with labels.
            match: '%{DATE} %{TIME} %{USER:user} %{NUMBER}'
            labels:
                user: '{{.user}}'
      server:
          port: 9144

An array of additional flags to pass to the grok_exporter daemon:

    prometheus_grok_exporter_fstab_extra_opts: []

The version of grok_exporter_fstab to install. The default version can be found in the [grok_exporter_fstab variables file](../vars/software/grok_exporter_fstab.yml) and the default version can be overridden using the following variable:

    prometheus_grok_exporter_fstab_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_grok_exporter_fstab_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9144:

    prometheus_grok_exporter_fstab_host: "0.0.0.0"
    prometheus_grok_exporter_fstab_port: 9144
