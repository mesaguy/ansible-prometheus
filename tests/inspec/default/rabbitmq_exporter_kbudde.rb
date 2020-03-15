# encoding: utf-8
# author: Mesaguy

describe file('/opt/prometheus/exporters/rabbitmq_exporter_kbudde/active') do
    it { should be_symlink }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe file('/opt/prometheus/exporters/rabbitmq_exporter_kbudde/active/rabbitmq_exporter') do
    it { should be_file }
    it { should be_executable }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe service('rabbitmq_exporter_kbudde') do
    it { should be_enabled }
    it { should be_installed }
    it { should be_running }
end

describe processes(Regexp.new("^/opt/prometheus/exporters/rabbitmq_exporter_kbudde/(v)?([.0-9A-Z\-]+|[.0-9.A-Z\-]+__go-[0-9.]+)/rabbitmq_exporter")) do
    it { should exist }
    its('entries.length') { should eq 1 }
    its('users') { should include 'prometheus' }
end

describe port(9419) do
    it { should be_listening }
end

describe http('http://127.0.0.1:9419/metrics') do
    its('status') { should cmp 200 }
    its('body') { should match /rabbitmq_exporter_build_info/ }
end
