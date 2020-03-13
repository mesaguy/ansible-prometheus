# encoding: utf-8
# author: Mesaguy

describe file('/opt/prometheus/exporters/sql_exporter_free/active') do
    it { should be_symlink }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe file('/opt/prometheus/exporters/sql_exporter_free/active/sql_exporter') do
    it { should be_file }
    it { should be_executable }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe service('sql_exporter_free') do
    it { should be_enabled }
    it { should be_installed }
    it { should be_running }
end

describe processes(Regexp.new("^/opt/prometheus/exporters/sql_exporter_free/(v)?([0-9.]+|[0-9.]+__go-[0-9.]+)/sql_exporter")) do
    it { should exist }
    its('entries.length') { should eq 1 }
    its('users') { should include 'prometheus' }
end

describe port(9399) do
    it { should be_listening }
end
