# encoding: utf-8
# author: Mesaguy

describe file('/opt/prometheus/exporters/ntp_exporter_sapcc/active') do
    it { should be_symlink }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe file('/opt/prometheus/exporters/ntp_exporter_sapcc/active/ntp_exporter') do
    it { should be_file }
    it { should be_executable }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe service('ntp_exporter_sapcc') do
    it { should be_enabled }
    it { should be_installed }
    it { should be_running }
end

describe processes(Regexp.new("^/opt/prometheus/exporters/ntp_exporter_sapcc/(v)?([0-9.]+|[0-9.a-z\-]+__go-[0-9.]+)/ntp_exporter")) do
    it { should exist }
    its('entries.length') { should eq 1 }
    its('users') { should include 'prometheus' }
end

describe port(9559) do
    it { should be_listening }
end

# 2019-11-21 Stops responding when polling broken localhost NTP, cannot test:
#describe http('http://127.0.0.1:9559/metrics') do
#    its('status') { should cmp 200 }
#    its('body') { should match /ntp_scrape_duration_seconds_sum/ }
#end
