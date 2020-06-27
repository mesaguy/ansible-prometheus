# encoding: utf-8
# author: Mesaguy

describe user('prometheus') do
  it { should exist }
end

describe group('prometheus') do
  it { should exist }
end

describe file('/opt/prometheus') do
    it { should be_directory }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe file('/opt/prometheus/etc') do
    it { should be_directory }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe file('/opt/prometheus/scripts') do
    it { should be_directory }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe file('/opt/prometheus/tmp') do
    it { should be_directory }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'prometheus' }
    its('group') { should eq 'prometheus' }
end

describe file('/opt/prometheus/var') do
    it { should be_directory }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'prometheus' }
    its('group') { should eq 'prometheus' }
end

describe file('/opt/prometheus/prometheus') do
    it { should be_directory }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe file('/opt/prometheus/prometheus/active') do
    it { should be_symlink }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe file('/opt/prometheus/prometheus/active/promtool') do
    it { should be_file }
    it { should be_executable }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe file('/opt/prometheus/prometheus/active/prometheus') do
    it { should be_file }
    it { should be_executable }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe command('sudo /opt/prometheus/prometheus/active/promtool check config /opt/prometheus/etc/prometheus.yml') do
  its('exit_status') { should eq 0 }
end

describe service('prometheus') do
    it { should be_enabled }
    it { should be_installed }
    it { should be_running }
end

describe processes(Regexp.new("^/opt/prometheus/prometheus/(v)?([0-9.]+|[0-9.]+__go-[0-9.]+)/prometheus")) do
    it { should exist }
    its('entries.length') { should eq 1 }
    its('users') { should include 'prometheus' }
end

describe port(9090) do
    it { should be_listening }
end

describe http('http://127.0.0.1:9090/graph') do
    its('status') { should cmp 200 }
    its('body') { should include '<title>Prometheus Time Series Collection and Processing Server</title>' }
end
