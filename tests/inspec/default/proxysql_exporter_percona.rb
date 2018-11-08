# encoding: utf-8
# author: Mesaguy

describe file('/opt/prometheus/exporters/proxysql_exporter_percona/active') do
    it { should be_symlink }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe file('/opt/prometheus/exporters/proxysql_exporter_percona/active/proxysql_exporter') do
    it { should be_file }
    it { should be_executable }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

# Verify the 'proxysql_exporter_percona' service is running
control '01' do
  impact 1.0
  title 'Verify proxysql_exporter_percona service'
  desc 'Ensures proxysql_exporter_percona service is up and running'
  describe service('proxysql_exporter_percona') do
    it { should be_enabled }
    it { should be_installed }
    it { should be_running }
  end
end

describe processes(Regexp.new("^/opt/prometheus/exporters/proxysql_exporter_percona/([0-9.]+|[0-9.]+__go-[0-9.]+)/proxysql_exporter")) do
    it { should exist }
    its('entries.length') { should eq 1 }
    its('users') { should include 'prometheus' }
end

describe port(42004) do
    it { should be_listening }
end

describe http('http://127.0.0.1:42004/metrics') do
    its('status') { should cmp 200 }
    its('body') { should match /proxysql_exporter_last_scrape_duration_seconds/ }
end
