To enable [alertmanager](https://github.com/prometheus/alertmanager) include role task: alertmanager

Alertmanager configuration files are validated using 'amtool' before Alertmanager is restarted.

The configuration content. The example below utilizes a file named 'alertmanager.yml' in your Ansible root directory's 'files' directory. If no configuration content is defined, a default configuration file is utilized. You will want to customize your configuration file content!:

    prometheus_alertmanager_cfg: '{{ lookup("file", "../files/alertmanager.yml") | from_yaml }}'

An array of additional flags to pass to the alertmanager daemon:

    prometheus_alertmanager_extra_opts: []

The version of Alertmanager to install. The default version can be found in the [alertmanager variables file](../vars/software/alertmanager.yml) and the default version can be overridden using the following variable:

    prometheus_alertmanager_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_alertmanager_use_prerelease: true

Where to store Alertmanager's data, defaults to /opt/prometheus/var/alertmanager

Port and IP to listen on. Defaults to listening on all available IPs on port 9093:

    prometheus_alertmanager_host: "0.0.0.0"
    prometheus_alertmanager_port: 9093
