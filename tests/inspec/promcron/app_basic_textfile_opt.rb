# Cron prom file does not exist
describe file('/tmp/cron_app_textfile_dir.prom') do
  it { should_not exist }
end

# Creates the prom file in specified textfile directory, /tmp
describe command('ls > /dev/null ; sudo -u app promcron -t /tmp app_textfile_dir $?') do
  its('exit_status') { should eq 0 }
  its('stderr') { should eq '' }
  its('stdout') { should eq '' }
end

## Resulting prom file is as expected
describe file('/tmp/cron_app_textfile_dir.prom') do
  it { should be_file }
  its('content') { should match /# HELP cron_app_textfile_dir_endtime Unix time in microseconds./ }
  its('content') { should match /# TYPE cron_app_textfile_dir_endtime gauge/ }
  its('content') { should match /cron_app_textfile_dir_endtime{user="app",promcron_name="app_textfile_dir",promcron="endtime"} [0-9]{10}\.[0-9]{3}$/ }
  its('content') { should match /# HELP cron_app_textfile_dir Process return code./ }
  its('content') { should match /# TYPE cron_app_textfile_dir gauge/ }
  its('content') { should match /cron_app_textfile_dir{user="app",promcron_name="app_textfile_dir",promcron="value"} 0/ }
  its('size') { should > 200 }
  it { should_not be_more_permissive_than('0664') }
  its('owner') { should eq 'app' }
  its('group') { should eq 'app' }
end

# Remove prom file
describe command('sudo rm -f /tmp/cron_app_textfile_dir.prom*') do
  its('exit_status') { should eq 0 }
end
