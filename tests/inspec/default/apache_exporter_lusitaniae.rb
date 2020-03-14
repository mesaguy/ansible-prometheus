# encoding: utf-8
# author: Mesaguy

describe file('/opt/prometheus/exporters/apache_exporter_lusitaniae/active') do
    it { should be_symlink }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe file('/opt/prometheus/exporters/apache_exporter_lusitaniae/active/apache_exporter') do
    it { should be_file }
    it { should be_executable }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe service('apache_exporter_lusitaniae') do
    it { should be_enabled }
    it { should be_installed }
    it { should be_running }
end

describe processes(Regexp.new("^/opt/prometheus/exporters/apache_exporter_lusitaniae/(v)?([0-9.]+|[0-9.]+__go-[0-9.]+)/apache_exporter")) do
    it { should exist }
    its('entries.length') { should eq 1 }
    its('users') { should include 'prometheus' }
end

describe port(9117) do
    it { should be_listening }
end

describe http('http://127.0.0.1:9117/metrics') do
    its('status') { should cmp 200 }
    its('body') { should match /apache_exporter_scrape_failures_total/ }
end
