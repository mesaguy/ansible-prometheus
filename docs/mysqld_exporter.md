# Mysqld exporter configuration

To enable [mysqld_exporter](https://github.com/prometheus/mysqld_exporter) include role task: mysqld_exporter

The [mysqld_exporter](https://github.com/prometheus/mysqld_exporter) requires configuration before use! You must grant permissions for this exporter to read select data from MySQL and you must configure a .my.cnf file with the credentials this module will utilize.

An array of additional flags to pass to the mysqld_exporter daemon:

    prometheus_mysqld_exporter_extra_opts: []

The version of mysqld_exporter to install. The default version can be found in the [mysqld_exporter variables file](../vars/software/mysqld_exporter.yml) and the default version can be overridden using the following variable:

    prometheus_mysqld_exporter_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_mysqld_exporter_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9104:

    prometheus_mysqld_exporter_host: "0.0.0.0"
    prometheus_mysqld_exporter_port: 9104

After following the [mysqld_exporter user creation or grant instructions](https://github.com/prometheus/mysqld_exporter), the following variables can be used to define the MySQL username and password mysqld_exporter can utilize to poll MySQL:

    prometheus_mysqld_exporter_username: mysqld_exporter
    prometheus_mysqld_exporter_password: _password_

The following variables can optionally define a host and/or socket used by mysqld_exporter to connect to MySQL:

    prometheus_mysqld_exporter_host: mysql.example.org
    prometheus_mysqld_exporter_socket: /var/lib/mysql/mysql.sock
