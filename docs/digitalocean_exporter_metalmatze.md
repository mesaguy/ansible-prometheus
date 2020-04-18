# DigitalOcean exporter (metalmatze) configuration

Environmental variables to pass to the digitalocean_exporter_metalmatze exporter. These environmental variables are used as a primary method of configuring the exporter:

    prometheus_digitalocean_exporter_metalmatze_env_vars:
      DIGITALOCEAN_TOKEN: 1234567890ABCDEFG

An array of additional flags to pass to the digitalocean_exporter daemon:

    prometheus_digitalocean_exporter_metalmatze_extra_opts: []

The version of digitalocean_exporter_metalmatze to install. The default version can be found in the [digitalocean_exporter_metalmatze variables file](../vars/software/digitalocean_exporter_metalmatze.yml) and the default version can be overridden using the following variable:

    prometheus_digitalocean_exporter_metalmatze_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_digitalocean_exporter_metalmatze_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9212:

    prometheus_digitalocean_exporter_metalmatze_host: "0.0.0.0"
    prometheus_digitalocean_exporter_metalmatze_port: 9212
