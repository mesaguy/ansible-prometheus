# Cron prom file does not exist
describe file('/etc/prometheus/node_exporter_textfiles/cron_app_fail.prom') do
  it { should_not exist }
end

# Setup permissions for app to create prom file
describe command('sudo promcron -s app app_fail') do
  its('exit_status') { should eq 0 }
  its('stderr') { should eq '' }
  its('stdout') { should eq '' }
end

# Creates the prom file, returns '2' because 'ls' returned '2'
describe command('ls /no_such_file 2> /dev/null ; sudo -u app promcron app_fail $?') do
  its('exit_status') { should_not eq '0' }
  its('stderr') { should eq '' }
  its('stdout') { should eq '' }
end

## Resulting prom file is as expected
describe file('/etc/prometheus/node_exporter_textfiles/cron_app_fail.prom') do
  it { should be_file }
  its('content') { should match /# HELP cron_app_fail_endtime Unix time in microseconds./ }
  its('content') { should match /# TYPE cron_app_fail_endtime gauge/ }
  its('content') { should match /cron_app_fail_endtime{user="app",job_type="cron_time"}/ }
  its('content') { should match /# HELP cron_app_fail Process return code./ }
  its('content') { should match /# TYPE cron_app_fail gauge/ }
  its('content') { should match /cron_app_fail{user="app",job_type="cron"} [1-2]/ }
  its('size') { should > 200 }
  its('mode') { should cmp '0644' }
  its('owner') { should eq 'app' }
  its('group') { should eq 'root' }
end

# Remove prom file
describe command('sudo rm -f /etc/prometheus/node_exporter_textfiles/cron_app_fail.prom') do
  its('exit_status') { should eq 0 }
end
