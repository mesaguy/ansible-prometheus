# DigitalOcean exporter (metalmatze) configuration

Environmental variables to pass to the digitalocean_exporter_metalmatze exporter. These environmental variables are used as a primary method of configuring the exporter:

    prometheus_digitalocean_exporter_metalmatze_env_vars:
      DIGITALOCEAN_TOKEN: 1234567890ABCDEFG

An array of additional flags to pass to the digitalocean_exporter daemon:

    prometheus_digitalocean_exporter_metalmatze_extra_opts: []

The version of digitalocean_exporter to install. The source version defines the version as specified in version control:

    prometheus_digitalocean_exporter_metalmatze_version: "0.5"
    prometheus_digitalocean_exporter_metalmatze_src_version: "v0.5"

Port and IP to listen on. Defaults to listening on all available IPs on port 9212:

    prometheus_digitalocean_exporter_metalmatze_host: "0.0.0.0"
    prometheus_digitalocean_exporter_metalmatze_port: 9212
