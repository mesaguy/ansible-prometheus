# encoding: utf-8
# author: Mesaguy

describe file('/etc/prometheus/tgroups') do
    it { should be_directory }
    its('mode') { should cmp '0775' }
    its('owner') { should eq 'prometheus' }
    its('group') { should eq 'prometheus' }
end

describe command('find /etc/prometheus/tgroups -type f').stdout.split().length do |count|
  its(count) { is_expected.to eq 2 }
end

describe file('/etc/prometheus/tgroups/archlinux-node_exporter.yml') do
    it { should be_file }
    its('md5sum') { should eq '58488e4080d56b8622092aa860156825' }
    its('mode') { should cmp '0644' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe file('/etc/prometheus/tgroups/archlinux-statsd_exporter.yml') do
    it { should be_file }
    its('md5sum') { should eq 'ea718563cc9599c10631daa84cb82c97' }
    its('mode') { should cmp '0644' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end
