# encoding: utf-8
# author: Mesaguy

# File should be purged as an orphan rule
describe file('/opt/prometheus/etc/rules/orphan.rules') do
  it { should_not exist }
end

# Rule file should exist
describe file('/opt/prometheus/etc/rules/promcron.rules') do
  it { should be_file }
  its('mode') { should cmp '0644' }
  its('owner') { should eq 'prometheus' }
  its('group') { should eq 'prometheus' }
end

# Validate test rules
describe command('/opt/prometheus/prometheus/active/promtool check rules /etc/prometheus/rules/*') do
  its('exit_status') { should eq 0 }
end
