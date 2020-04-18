# Ceph exporter (digitalocean) configuration

To enable [ceph_exporter by digitalocean](https://github.com/digitalocean/ceph_exporter) include role task: ceph_exporter_digitalocean

Ceph libraries must be installed in order to compile this exporter. This Ansible role does not install the prerequisite Ceph libraries as your source and version may vary.

An array of additional flags to pass to the ceph_exporter daemon (ie):

    prometheus_ceph_exporter_digitalocean_extra_opts:
      - '--ceph.config=/etc/ceph/ceph.conf'
      - '--exporter.config=/etc/ceph/exporter.yml'

The version of ceph_exporter_digitalocean to install. The default version can be found in the [ceph_exporter_digitalocean variables file](../vars/software/ceph_exporter_digitalocean.yml) and the default version can be overridden using the following variable:

    prometheus_ceph_exporter_digitalocean_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_ceph_exporter_digitalocean_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9128:

    prometheus_ceph_exporter_digitalocean_host: "0.0.0.0"
    prometheus_ceph_exporter_digitalocean_port: 9128
