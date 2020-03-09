# Nvidia GPU exporter (mindprince) configuration

An array of additional flags to pass to the nvidia_gpu_exporter daemon:

    prometheus_nvidia_gpu_exporter_mindprince_extra_opts: []

The version of nvidia_gpu_exporter to install. As there is no release, the version is a git commit hash:

    prometheus_nvidia_gpu_exporter_mindprince_version: "3897bdad246f3bc0e7105805d4442b9c9c7b06d2"

Port and IP to listen on. Defaults to listening on all available IPs on port 9445:

    prometheus_nvidia_gpu_exporter_mindprince_host: "0.0.0.0"
    prometheus_nvidia_gpu_exporter_mindprince_port: 9445
