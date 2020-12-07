# nginx exporter (nginxinc) configuration

To enable [nginx_exporter by nginxinc](https://github.com/nginxinc/nginx-prometheus-exporter) include role task: nginx_exporter_nginxinc

An array of additional flags to pass to the nginx_exporter daemon (ie):

    prometheus_nginx-prometheus-exporter_nginxinc_extra_opts:
     - '-nginx.scrape-uri http://<nginx>:8080/stub_status'

The version of nginx_exporter_nginxinc to install. The default version can be found in the [nginx_exporter_nginxinc variables file](../vars/software/nginx_exporter_nginxinc.yml) and the default version can be overridden using the following variable:

    prometheus_nginx-prometheus-exporter_nginxinc_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_nginx-prometheus-exporter_nginxinc_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9113:

    prometheus_nginx_exporter_nginxinc_host: "0.0.0.0"
    prometheus_nginx_exporter_nginxinc_port: 9113
