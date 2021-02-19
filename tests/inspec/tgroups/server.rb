# encoding: utf-8
# author: Mesaguy

describe file('/opt/prometheus/etc/tgroups-server') do
    it { should be_directory }
    its('mode') { should cmp '0775' }
    its('owner') { should eq 'prometheus' }
    its('group') { should eq 'prometheus' }
end

describe command('find /opt/prometheus/etc/tgroups-server -type f').stdout.split().length do |count|
  its(count) { is_expected.to eq 5 }
end

describe file('/opt/prometheus/etc/tgroups-server/debian-10-node_exporter.yml') do
    it { should be_file }
    its('md5sum') { should eq '73d48cc65d47afc9ef8b27e5e93c8b9c' }
    its('mode') { should cmp '0644' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe file('/opt/prometheus/etc/tgroups-server/debian-10-statsd_exporter.yml') do
    it { should be_file }
    its('md5sum') { should eq '810455ccea9dc275abf870f2214de2d3' }
    its('mode') { should cmp '0644' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe file('/opt/prometheus/etc/tgroups-server/test-docker.yml') do
    it { should be_file }
    its('md5sum') { should eq '6ffd05ee146bea5c6336431122836ed3' }
    its('mode') { should cmp '0644' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe file('/opt/prometheus/etc/tgroups-server/test-node_exporter.yml') do
    it { should be_file }
    its('md5sum') { should eq '9b38dbfef8e6878aa970c55cce51b6d2' }
    its('mode') { should cmp '0644' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end
