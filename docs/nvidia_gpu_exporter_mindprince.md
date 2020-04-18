# Nvidia GPU exporter (mindprince) configuration

An array of additional flags to pass to the nvidia_gpu_exporter daemon:

    prometheus_nvidia_gpu_exporter_mindprince_extra_opts: []

The version of nvidia_gpu_exporter_mindprince to install. The default version can be found in the [nvidia_gpu_exporter_mindprince variables file](../vars/software/nvidia_gpu_exporter_mindprince.yml) and the default version can be overridden using the following variable:

    prometheus_nvidia_gpu_exporter_mindprince_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_nvidia_gpu_exporter_mindprince_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9445:

    prometheus_nvidia_gpu_exporter_mindprince_host: "0.0.0.0"
    prometheus_nvidia_gpu_exporter_mindprince_port: 9445
