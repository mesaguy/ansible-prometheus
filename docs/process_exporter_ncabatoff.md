# Process exporter (ncabatoff) configuration

To enable [process-exporter](https://github.com/ncabatoff/process-exporter) include role task: process-exporter_ncabatoff

This task has been configured to be capable of installing and managing multiple instances of process-exporter. Since process-exporter reads from /proc, only root and the user who owns each process may lookup metrics for each process. You can run a single process-exporter as root and monitor all system processes, but doing so is likely a security risk. It is safest to run one unprivileged instance of process-exporter for each user's processes you wish to monitor.

The configuration content. The example below utilizes a variables specifying the name of the service (name), the user that process-exporter should run as (user), and the configuration content (data). In this example configuration file there are two instances of process-exporter configured to run. See [process-exporter](https://github.com/ncabatoff/process-exporter) documentation for configuration details.

```yaml
    prometheus_process_exporter_ncabatoff_cfgs:
      - name: prometheus
        user: prometheus
        port: 9256
        data:
          process_names:
            - comm:
                - bash
            - exe:
                - sshd
      - name: apache
        user: apache
        port: 9257
        data:
          process_names:
            - comm:
                - bash
            - exe:
                - apache
```

An array of additional flags to pass to the process_exporter daemon:

    prometheus_process_exporter_ncabatoff_extra_opts: []

The version of process_exporter_ncabatoff to install. The default version can be found in the [process_exporter_ncabatoff variables file](../vars/software/process_exporter_ncabatoff.yml) and the default version can be overridden using the following variable:

    prometheus_process_exporter_ncabatoff_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_process_exporter_ncabatoff_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9256. This is the default port and can/should be overridden using the configuration as exampled above in this section:

    prometheus_process_exporter_ncabatoff_host: "0.0.0.0"
    prometheus_process_exporter_ncabatoff_port: 9256
