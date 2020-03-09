# Gluster exporter (ofesseler) configuration

To enable [gluster_exporter by ofesseler](https://github.com/ofesseler/gluster_exporter) include role task: gluster_exporter_ofesseler

An array of additional flags to pass to the gluster_exporter daemon:

    prometheus_gluster_exporter_ofesseler_extra_opts: []

The gluster exporter needs to run as root if gluster is running as root:

    prometheus_gluster_exporter_ofesseler_runas: root

The version of gluster_exporter to install. The source version defines the version as specified in version control:

    prometheus_gluster_exporter_ofesseler_version: "0.2.7"
    prometheus_gluster_exporter_ofesseler_src_version: "v0.2.7"

Port and IP to listen on. Defaults to listening on all available IPs on port 9189:

    prometheus_gluster_exporter_ofesseler_host: "0.0.0.0"
    prometheus_gluster_exporter_ofesseler_port: 9189
