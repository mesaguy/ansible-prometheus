# encoding: utf-8
# author: Mesaguy

describe file('/opt/prometheus/alertmanager/active') do
    it { should be_symlink }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe file('/opt/prometheus/alertmanager/active/alertmanager') do
    it { should be_file }
    it { should be_executable }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe file('/opt/prometheus/alertmanager/active/amtool') do
    it { should be_file }
    it { should be_executable }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe command('sudo /opt/prometheus/alertmanager/active/amtool check-config /opt/prometheus/etc/alertmanager.yml') do
  its('exit_status') { should eq 0 }
end

describe command('sudo /opt/prometheus/alertmanager/active/amtool check-config /opt/prometheus/etc/alertmanager.yml') do
  its('exit_status') { should eq 0 }
end

describe service('alertmanager') do
    it { should be_enabled }
    it { should be_installed }
    it { should be_running }
end

describe processes(Regexp.new("^/opt/prometheus/alertmanager/(v)?([0-9.]+|[0-9.]+__go-[0-9.]+)/alertmanager")) do
    it { should exist }
    its('entries.length') { should eq 1 }
    its('users') { should include 'prometheus' }
end

describe port(9093) do
    it { should be_listening }
end

describe http('http://127.0.0.1:9093/metrics') do
    its('status') { should cmp 200 }
    its('body') { should match /alertmanager_cluster_messages_received_total/ }
end
