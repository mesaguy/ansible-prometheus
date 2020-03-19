describe file('/opt/prometheus/scripts/promcron') do
  it { should be_file }
  it { should be_executable }
  its('size') { should > 1500 }
  its('mode') { should cmp '0555' }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
end

# Run promcron with insufficient arguments
describe command('promcron') do
  its('exit_status') { should eq 2 }
  its('stderr') { should match /NAME must be defined/ }
  its('stdout') { should eq '' }
end
describe command('promcron NAME_BUT_NO_VALUE') do
  its('exit_status') { should eq 2 }
  its('stderr') { should match /NAME and VALUE must be defined/ }
  its('stdout') { should eq '' }
end

# Metric name must conform to regex
describe command('promcron test- 0') do
  its('exit_status') { should eq 2 }
  its('stderr') { should match /Metric name "cron_test-" must match regex: / }
  its('stdout') { should eq '' }
end

# Label name must conform to regex
describe command('promcron -l will-fail=test test 0') do
  its('exit_status') { should eq 2 }
  its('stderr') { should match /Label name "will-fail" must match regex: / }
  its('stdout') { should eq '' }
end

# Run help
describe command('promcron -h') do
  its('exit_status') { should eq 1 }
  its('stderr') { should eq '' }
  its('stdout') { should match /Usage: promcron/ }
end

# Value must be a number and must be 0 through 255
describe command('promcron test test') do
  its('exit_status') { should eq 2 }
  its('stderr') { should match /VALUE must be a return code \(Integer between 0 and 255\)/ }
  its('stdout') { should eq '' }
end
describe command('promcron test 256') do
  its('exit_status') { should eq 2 }
  its('stderr') { should match /VALUE must be a return code \(Integer between 0 and 255\)/ }
  its('stdout') { should eq '' }
end

if ((os.name == 'alpine' and os.release.match('^3\.[1,2,3,4,6,7,8]\..*')) or (os.name == 'amazon' and ['2', '2016.09', '2017.03', '2017.09', '2018.03'].include?(os.release)) or (os.name == 'oracle' and os.release.match('^[7-8]\..*')) or (os.family == 'redhat' and os.name != 'oracle' and os.release.match('^[6-8]\..*')) or (os.family == 'suse' and ['13.1', '13.2', '42.1', '42.2', '42.3'].include?(os.release)))
    # No sponge
    describe file('/opt/prometheus/scripts/promcron') do
      its('content') { should match /HAS_SPONGE="False"/ }
    end
else
    # Has sponge
    describe file('/opt/prometheus/scripts/promcron') do
      its('content') { should match /HAS_SPONGE="True"/ }
    end
end
