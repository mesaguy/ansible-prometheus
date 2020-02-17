
## Resulting prom file is as expected
describe file('/etc/security/limits.d/prometheus.conf') do
  it { should be_file }
  its('content') { should match /prometheus\thard\tnofile\t8192/ }
  its('content') { should match /prometheus\tsoft\tnofile\t4096/ }
  its('mode') { should cmp '0444' }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
end
