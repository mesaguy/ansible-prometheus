# CloudWatch exporter configuration

To enable [cloudwatch_exporter](https://github.com/prometheus/cloudwatch_exporter) include role task: cloudwatch_exporter

The configuration content. The example below utilizes a file named 'cloudwatch_exporter.yml' in your Ansible root directory's 'files' directory. If no configuration content is defined, a default configuration file is utilized. You will want to customize your configuration file content!:

    prometheus_cloudwatch_exporter_cfg: '{{ lookup("file", "../files/cloudwatch_exporter.yml") | from_yaml }}'

Alternatively, the configuration file can be defined directly:

    prometheus_cloudwatch_exporter_cfg:
      region: eu-west-1
      metrics:
       - aws_namespace: AWS/ELB
         aws_metric_name: RequestCount
         aws_dimensions: [AvailabilityZone, LoadBalancerName]
         aws_dimension_select:
           LoadBalancerName: [myLB]
         aws_statistics: [Sum]

An array of additional flags to pass to the cloudwatch_exporter daemon:

    prometheus_cloudwatch_exporter_extra_opts: []

The version of cloudwatch_exporter to install:

    prometheus_cloudwatch_exporter_version: "0.8.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9106:

    prometheus_cloudwatch_exporter_host: "0.0.0.0"
    prometheus_cloudwatch_exporter_port: 9106
