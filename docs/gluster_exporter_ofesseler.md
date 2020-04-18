# Gluster exporter (ofesseler) configuration

To enable [gluster_exporter by ofesseler](https://github.com/ofesseler/gluster_exporter) include role task: gluster_exporter_ofesseler

An array of additional flags to pass to the gluster_exporter daemon:

    prometheus_gluster_exporter_ofesseler_extra_opts: []

The gluster exporter needs to run as root if gluster is running as root:

    prometheus_gluster_exporter_ofesseler_runas: root

The version of gluster_exporter_ofesseler to install. The default version can be found in the [gluster_exporter_ofesseler variables file](../vars/software/gluster_exporter_ofesseler.yml) and the default version can be overridden using the following variable:

    prometheus_gluster_exporter_ofesseler_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_gluster_exporter_ofesseler_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9189:

    prometheus_gluster_exporter_ofesseler_host: "0.0.0.0"
    prometheus_gluster_exporter_ofesseler_port: 9189
