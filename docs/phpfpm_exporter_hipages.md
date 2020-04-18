# PHP-FPM exporter (hipages) configuration

To enable [phpfpm_exporter by hipages](https://github.com/hipages/php-fpm_exporter) include role task: phpfpm_exporter_hipages

An array of additional flags to pass to the phpfpm_exporter daemon:

    prometheus_phpfpm_exporter_hipages_extra_opts: []

The version of phpfpm_exporter_hipages to install. The default version can be found in the [phpfpm_exporter_hipages variables file](../vars/software/phpfpm_exporter_hipages.yml) and the default version can be overridden using the following variable:

    prometheus_phpfpm_exporter_hipages_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_phpfpm_exporter_hipages_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9145:

    prometheus_phpfpm_exporter_hipages_host: "0.0.0.0"
    prometheus_phpfpm_exporter_hipages_port: 9253
