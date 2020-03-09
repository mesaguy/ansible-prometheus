# SQL exporter (free) configuration

To enable [sql_exporter by free](https://github.com/free/sql_exporter) include role task: sql_exporter_free

The configuration content. The example below utilizes a file named 'sql_exporter_free.yml' in your Ansible root directory's 'files' directory. If no configuration content is defined, a default configuration file is utilized. You will want to customize your configuration file content!:

    prometheus_sql_exporter_free_cfg: '{{ lookup("file", "../files/sql_exporter_free.yml") | from_yaml }}'

Alternatively, the configuration file can be defined directly:

    prometheus_sql_exporter_free_cfg:
      global:
        # Subtracted from Prometheus' scrape_timeout to give us some headroom and prevent Prometheus from
        # timing out first.
        scrape_timeout_offset: 500ms
        # Minimum interval between collector runs: by default (0s) collectors are executed on every scrape.
        min_interval: 0s
        # Maximum number of open connections to any one target. Metric queries will run concurrently on
        # multiple connections.
        max_connections: 3
        # Maximum number of idle connections to any one target.
        max_idle_connections: 3

      # The target to monitor and the list of collectors to execute on it.
      target:
        # Data source name always has a URI schema that matches the driver name. In some cases (e.g. MySQL)
        # the schema gets dropped or replaced to match the driver expected DSN format.
        data_source_name: 'sqlserver://prom_user:prom_password@dbserver1.example.com:1433'

An array of additional flags to pass to the sql_exporter daemon:

    prometheus_sql_exporter_free_extra_opts: []

The version of sql_exporter to install. The source version defines the version as specified in version control:

    prometheus_sql_exporter_free_version: "0.5"
    prometheus_sql_exporter_free_src_version: "0.5"

Port and IP to listen on. Defaults to listening on all available IPs on port 9399:

    prometheus_sql_exporter_free_host: "0.0.0.0"
    prometheus_sql_exporter_free_port: 9399
