# encoding: utf-8
# author: Mesaguy

describe file('/opt/prometheus/exporters/kafka_exporter_danielqsj/active') do
    it { should be_symlink }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe file('/opt/prometheus/exporters/kafka_exporter_danielqsj/active/kafka_exporter') do
    it { should be_file }
    it { should be_executable }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe service('kafka_exporter_danielqsj') do
    it { should be_enabled }
    it { should be_installed }
end
