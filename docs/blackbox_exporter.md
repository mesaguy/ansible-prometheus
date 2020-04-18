# Blackbox exporter configuration

To enable [blackbox_exporter](https://github.com/prometheus/blackbox_exporter) include role task: blackbox_exporter

The configuration content. The example below utilizes a file named 'blackbox_exporter.yml' in your Ansible root directory's 'files' directory. If no configuration content is defined, a default configuration file is utilized. You will want to customize your configuration file content!:

    prometheus_blackbox_exporter_cfg: '{{ lookup("file", "../files/blackbox_exporter.yml") | from_yaml }}'

Alternatively, the configuration file can be defined directly:

    prometheus_blackbox_exporter_cfg:
      http_2xx:
        http:
          fail_if_not_ssl: false
          fail_if_ssl: false
          method: GET
          no_follow_redirects: false
          preferred_ip_protocol: ip4
          tls_config:
            insecure_skip_verify: false
          valid_http_versions:
          - HTTP/1.1
          - HTTP/2
          valid_status_codes:
          - 200

An array of additional flags to pass to the blackbox_exporter daemon:

    prometheus_blackbox_exporter_extra_opts: []

The version of blackbox_exporter to install. The default version can be found in the [blackbox_exporter variables file](../vars/software/blackbox_exporter.yml) and the default version can be overridden using the following variable:

    prometheus_blackbox_exporter_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_blackbox_exporter_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9115:

    prometheus_blackbox_exporter_host: "0.0.0.0"
    prometheus_blackbox_exporter_port: 9115
