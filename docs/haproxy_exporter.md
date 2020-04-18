# HAProxy exporter configuration

To enable [haproxy_exporter](https://github.com/prometheus/haproxy_exporter) include role task: haproxy_exporter

An array of additional flags to pass to the haproxy_exporter daemon:

    prometheus_haproxy_exporter_extra_opts: []

The version of haproxy_exporter to install. The default version can be found in the [haproxy_exporter variables file](../vars/software/haproxy_exporter.yml) and the default version can be overridden using the following variable:

    prometheus_haproxy_exporter_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_haproxy_exporter_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9101:

    prometheus_haproxy_exporter_host: "0.0.0.0"
    prometheus_haproxy_exporter_port: 9101

To gather HAProxy stats via a unix socket, specify the path to the unix socket. Collecting HAProxy stats via the http and unix socket methods are mutually exclusive. It may also be necessary to run the haproxy_exporter as the user haproxy is running as:

    prometheus_haproxy_exporter_socket: '/run/haproxy/haproxy.sock'
    prometheus_haproxy_exporter_runas: haproxy

Enable HAProxy statistics via socket in the HAProxy globals section:

    global
      stats socket /run/haproxy/haproxy.sock mode 666 level admin
      # Wait up to 2 minutes for input:
      stats timeout 2m
