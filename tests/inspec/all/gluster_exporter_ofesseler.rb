# encoding: utf-8
# author: Mesaguy

describe file('/opt/prometheus/exporters/gluster_exporter_ofesseler/active') do
    it { should be_symlink }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe file('/opt/prometheus/exporters/gluster_exporter_ofesseler/active/gluster_exporter') do
    it { should be_file }
    it { should be_executable }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

# Verify the 'gluster_exporter_ofesseler' service is running
control '01' do
  impact 1.0
  title 'Verify gluster_exporter_ofesseler service'
  desc 'Ensures gluster_exporter_ofesseler service is up and running'
  describe service('gluster_exporter_ofesseler') do
    it { should be_enabled }
    it { should be_installed }
    it { should be_running }
  end
end

describe processes('gluster_exporter') do
    it { should exist }
    its('entries.length') { should eq 1 }
    its('users') { should include 'prometheus' }
end

describe port(9189) do
    it { should be_listening }
end
