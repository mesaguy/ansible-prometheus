describe file('/opt/prometheus/scripts/promrun') do
  it { should be_file }
  it { should be_executable }
  its('size') { should > 1500 }
  its('mode') { should cmp '0555' }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
end

# Run promrun with insufficient arguments
describe command('promrun') do
  its('exit_status') { should eq 2 }
  its('stderr') { should match /NAME \(-n\) must be defined/ }
  its('stdout') { should eq '' }
end
describe command('promrun COMMAND_BUT_NO_NAME') do
  its('exit_status') { should eq 2 }
  its('stderr') { should match /NAME \(-n\) must be defined/ }
  its('stdout') { should eq '' }
end
describe command('promrun -n label_but_no_command') do
  its('exit_status') { should eq 2 }
  its('stderr') { should match /A command to run must be specified/ }
  its('stdout') { should eq '' }
end

# Run help
describe command('promrun -h') do
  its('exit_status') { should eq 1 }
  its('stderr') { should eq '' }
  its('stdout') { should match /Usage: promrun/ }
end

# Metric name must conform to regex
describe command('promrun -n test- ls') do
  its('exit_status') { should eq 2 }
  its('stderr') { should match /Metric name "promrun_test-" must match regex: / }
  its('stdout') { should eq '' }
end

# Label name must conform to regex
describe command('promrun -n test -l will-fail=test ls') do
  its('exit_status') { should eq 2 }
  its('stderr') { should match /Label name "will-fail" must match regex: / }
  its('stdout') { should eq '' }
end
