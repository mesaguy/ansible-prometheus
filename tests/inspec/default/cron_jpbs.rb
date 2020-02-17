# Test the 2 crontabs created while testing:

describe file('/var/spool/cron/root') do
  it { should be_file }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
  its('mode') { should cmp '0600' }
  its('sha256sum') { should eq '199671cec232dd0e699688088b91d2410209a7fd7e2422e07c8fd2b75275232a' }
end
describe file('/var/spool/cron/prometheus') do
  it { should be_file }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
  its('mode') { should cmp '0600' }
  its('sha256sum') { should eq '20db3644db3dfa6a5c93d50e4a322b7d66d907d2ae24730e43a5a4ab4e04da29' }
end

# Test the 2 cron files created while testing:

describe file('/etc/cron.d/prometheus_script_echo_test3') do
  it { should be_file }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
  its('mode') { should cmp '0644' }
  its('sha256sum') { should eq 'f0a55f254befa3f29d10471d94ca1361a4df41af26c60035d96734309444740c' }
end
describe file('/etc/cron.d/prometheus_script_echo_test4') do
  it { should be_file }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
  its('mode') { should cmp '0644' }
  its('sha256sum') { should eq 'd06860b9403bde8aa9dc28b6d894fe5f84933d270bcd2b44cf4da755e489d955' }
end
