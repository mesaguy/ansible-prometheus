# Nvidia CPU exporter (BugRoger) configuration

An array of additional flags to pass to the nvidia_exporter daemon:

    prometheus_nvidia_exporter_bugroger_extra_opts: []

The version of nvidia_exporter to install. As there is no release, the version is a git commit hash:

    prometheus_nvidia_exporter_bugroger_version: "f38931eea308b265477dc64a86594cc288bf270b"

Port and IP to listen on. Defaults to listening on all available IPs on port 9401:

    prometheus_nvidia_exporter_bugroger_host: "0.0.0.0"
    prometheus_nvidia_exporter_bugroger_port: 9401
