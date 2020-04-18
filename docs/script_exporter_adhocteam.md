# Script exporter (adhocteam) configuration

To enable [script_exporter by adhocteam](https://github.com/adhocteam/script_exporter) include role task: script_exporter_adhocteam

This task has been configured to be capable of installing and managing multiple instances of script-exporter. You can run a single script-exporter as root and run commands without privilege considerations, but doing so is likely a security risk. It is safest to run one unprivileged instance of script-exporter for each user's processes you wish to monitor.

The configuration content. The example below utilizes a variables specifying the name of the service (name), the user that script-exporter should run as (user), and the configuration content (data). In this example configuration file there are two instances of script-exporter configured to run. See [script-exporter](https://github.com/adhocteam/script_exporter) documentation for configuration details.

```yaml
    prometheus_script_exporter_adhocteam_cfgs:
      - name: TEST
        user: prometheus
        port: 19172
        data:
          scripts:
            - name: success
              script: sleep 5
      - name: TEST2
        user: nobody
        port: 29172
        data:
          scripts:
            - name: failure
              script: sleep 2 && exit 1
```

An array of additional flags to pass to the script_exporter daemon (ie):

    prometheus_script_exporter_adhocteam_extra_opts: []

The version of script_exporter_adhocteam to install. The default version can be found in the [script_exporter_adhocteam variables file](../vars/software/script_exporter_adhocteam.yml) and the default version can be overridden using the following variable:

    prometheus_script_exporter_adhocteam_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_script_exporter_adhocteam_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9172:

    prometheus_script_exporter_adhocteam_host: "0.0.0.0"
    prometheus_script_exporter_adhocteam_port: 9172
