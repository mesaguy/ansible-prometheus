# encoding: utf-8
# author: Mesaguy

describe file('/opt/prometheus/exporters/nvidia_exporter_bugroger/active') do
    it { should be_symlink }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe file('/opt/prometheus/exporters/nvidia_exporter_bugroger/active/nvidia-exporter') do
    it { should be_file }
    it { should be_executable }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe service('nvidia_exporter_bugroger') do
    it { should be_enabled }
    it { should be_installed }
    it { should be_running }
end

describe processes(Regexp.new("^/opt/prometheus/exporters/nvidia_exporter_bugroger/(v)?([0-9a-z]+__go-[0-9.]+)/nvidia-exporter")) do
    it { should exist }
    its('entries.length') { should eq 1 }
    its('users') { should include 'prometheus' }
end

describe port(9401) do
    it { should be_listening }
end

describe http('http://127.0.0.1:9401/metrics') do
    its('status') { should cmp 200 }
    its('body') { should match /NVML Metric Collection Operational/ }
end
