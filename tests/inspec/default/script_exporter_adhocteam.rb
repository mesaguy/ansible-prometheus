# encoding: utf-8
# author: Mesaguy

describe file('/opt/prometheus/exporters/script_exporter_adhocteam/active') do
    it { should be_symlink }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe file('/opt/prometheus/exporters/script_exporter_adhocteam/active/script_exporter') do
    it { should be_file }
    it { should be_executable }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

# Verify the 'script_exporter_adhocteam' service is running
control '01' do
  impact 1.0
  title 'Verify script_exporter_adhocteam service'
  desc 'Ensures script_exporter_adhocteam service is up and running'
  describe service('process_exporter_ncabatoff__TEST') do
    it { should be_enabled }
    it { should be_installed }
    it { should be_running }
  end
end

describe processes(Regexp.new("^/opt/prometheus/exporters/script_exporter_adhocteam/(v)?([0-9.]+|[0-9.]+__go-[0-9.]+)/script_exporter")) do
    it { should exist }
    its('entries.length') { should eq 2 }
    its('users') { should include 'prometheus' }
    its('users') { should include 'kitchen' }
end

describe port(19172) do
    it { should be_listening }
end

describe port(29172) do
    it { should be_listening }
end

describe http('http://127.0.0.1:19172/probe?name=success') do
    its('status') { should cmp 200 }
    its('body') { should match /script_success{script="success"} 1/ }
end

describe http('http://127.0.0.1:29172/probe?name=failure') do
    its('status') { should cmp 200 }
    its('body') { should match /script_success{script="failure"} 0/ }
end
