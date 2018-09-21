# encoding: utf-8
# author: Mesaguy

describe file('/opt/prometheus/exporters/grok_exporter_fstab/active') do
    it { should be_symlink }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe file('/opt/prometheus/exporters/grok_exporter_fstab/active/grok_exporter') do
    it { should be_file }
    it { should be_executable }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

# Verify the 'grok_exporter_fstab' service is running
control '01' do
  impact 1.0
  title 'Verify grok_exporter_fstab service'
  desc 'Ensures grok_exporter_fstab service is up and running'
  describe service('grok_exporter_fstab') do
    it { should be_enabled }
    it { should be_installed }
    it { should be_running }
  end
end

describe processes(Regexp.new("^/opt/prometheus/exporters/grok_exporter_fstab/([0-9.]+|[0-9.]+__go-[0-9.]+)/grok_exporter")) do
    it { should exist }
    its('entries.length') { should eq 1 }
    its('users') { should include 'prometheus' }
end

describe port(9144) do
    it { should be_listening }
end

describe http('http://127.0.0.1:9144/metrics') do
    its('status') { should cmp 200 }
    its('body') { should match /grok_exporter_line_buffer_peak_load/ }
end
