# Nvidia CPU exporter (BugRoger) configuration

An array of additional flags to pass to the nvidia_exporter daemon:

    prometheus_nvidia_exporter_bugroger_extra_opts: []

The version of nvidia_exporter_bugroger to install. The default version can be found in the [nvidia_exporter_bugroger variables file](../vars/software/nvidia_exporter_bugroger.yml) and the default version can be overridden using the following variable:

    prometheus_nvidia_exporter_bugroger_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_nvidia_exporter_bugroger_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9401:

    prometheus_nvidia_exporter_bugroger_host: "0.0.0.0"
    prometheus_nvidia_exporter_bugroger_port: 9401
