# promhippie exporter (promhippie) configuration

To enable [dockerhub_exporter by promhippie](https://github.com/promhippie/dockerhub_exporter) include role task: dockerhub_exporter_promhippie

At least one *-dockerhub.repo* and/or *-dockerhub.org* must be defined. Multiple repos and organizations may be defined, comma delimited. An array of additional flags to pass to the dockerhub_exporter daemon (ie):

    prometheus_dockerhub_exporter_promhippie_extra_opts:
     - '-dockerhub.org fedora'
     - '-dockerhub.repo mysql/mysql-server,mysql/mysql-cluster'

The version of dockerhub_exporter_promhippie to install. The default version can be found in the [dockerhub_exporter_promhippie variables file](../vars/software/dockerhub_exporter_promhippie.yml) and the default version can be overridden using the following variable:

    prometheus_dockerhub_exporter_promhippie_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_dockerhub_exporter_promhippie_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9505:

    prometheus_dockerhub_exporter_promhippie_host: "0.0.0.0"
    prometheus_dockerhub_exporter_promhippie_port: 9505
