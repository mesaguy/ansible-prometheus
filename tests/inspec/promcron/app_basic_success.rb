# Cron prom file does not exist
describe file('/opt/prometheus/etc/node_exporter_textfiles/cron_app_basic.prom') do
  it { should_not exist }
end

# Fail to create prom file because correct permissions haven't been setup
describe command('sudo -u app promcron app_basic $?') do
  its('exit_status') { should eq 0 }
  its('stderr') { should match /Permission denied/ }
  its('stdout') { should eq '' }
end

# Get dryrun output for permissions for app to create prom file
if ((os.name == 'alpine' and os.release.match('^3\.[1,2,3,4,6,7,8]\..*')) or (os.name == 'amazon' and ['2', '2016.09', '2017.03', '2017.09', '2018.03'].include?(os.release)) or (os.name == 'oracle' and os.release.match('^[7-8]\..*')) or (os.family == 'redhat' and os.name != 'oracle' and os.release.match('^[6-8]\..*')) or (os.family == 'suse' and ['13.1', '13.2', '42.1', '42.2', '42.3'].include?(os.release)))
    describe command('sudo promcron -D -s app app_basic') do
      its('exit_status') { should eq 0 }
      its('stderr') { should eq '' }
      its('stdout') { should match /\[DRYRUN\] touch "\/opt\/prometheus\/etc\/node_exporter_textfiles\/cron_app_basic.prom" "\/opt\/prometheus\/etc\/node_exporter_textfiles\/cron_app_basic.prom.tmp" && chown app "\/opt\/prometheus\/etc\/node_exporter_textfiles\/cron_app_basic.prom" "\/opt\/prometheus\/etc\/node_exporter_textfiles\/cron_app_basic.prom.tmp"/ }
    end
else
    describe command('sudo promcron -D -s app app_basic') do
      its('exit_status') { should eq 0 }
      its('stderr') { should eq '' }
      its('stdout') { should match /\[DRYRUN\] touch "\/opt\/prometheus\/etc\/node_exporter_textfiles\/cron_app_basic.prom" && chown app "\/opt\/prometheus\/etc\/node_exporter_textfiles\/cron_app_basic.prom/ }
    end
end

if ((os.name == 'alpine' and os.release.match('^3\.[1,2,3,4,6,7,8]\..*')) or (os.name == 'amazon' and ['2', '2016.09', '2017.03', '2017.09', '2018.03'].include?(os.release)) or (os.name == 'oracle' and os.release.match('^[7-8]\..*')) or (os.family == 'redhat' and os.name != 'oracle' and os.release.match('^[6-8]\..*')) or (os.family == 'suse' and ['13.1', '13.2', '42.1', '42.2', '42.3'].include?(os.release)))
    # Setup permissions for app to create prom file (verbose mode)
    describe command('sudo promcron -v -s app app_basic') do
      its('exit_status') { should eq 0 }
      its('stderr') { should eq '' }
      its('stdout') { should match /touch "\/opt\/prometheus\/etc\/node_exporter_textfiles\/cron_app_basic.prom" "\/opt\/prometheus\/etc\/node_exporter_textfiles\/cron_app_basic.prom.tmp" && chown app "\/opt\/prometheus\/etc\/node_exporter_textfiles\/cron_app_basic.prom" "\/opt\/prometheus\/etc\/node_exporter_textfiles\/cron_app_basic.prom.tmp"/ }
    end
else
    # Setup permissions for app to create prom file (verbose mode)
    describe command('sudo promcron -v -s app app_basic') do
      its('exit_status') { should eq 0 }
      its('stderr') { should eq '' }
      its('stdout') { should match /touch "\/opt\/prometheus\/etc\/node_exporter_textfiles\/cron_app_basic.prom" && chown app "\/opt\/prometheus\/etc\/node_exporter_textfiles\/cron_app_basic.prom/ }
    end
end

# Setup permissions for app to create prom file
describe command('sudo promcron -s app app_basic') do
  its('exit_status') { should eq 0 }
  its('stderr') { should eq '' }
  its('stdout') { should eq '' }
end

# Creates the prom file
describe command('ls > /dev/null ; sudo -u app promcron app_basic $?') do
  its('exit_status') { should eq 0 }
  its('stderr') { should eq '' }
  its('stdout') { should eq '' }
end

## Resulting prom file is as expected
describe file('/opt/prometheus/etc/node_exporter_textfiles/cron_app_basic.prom') do
  it { should be_file }
  its('content') { should match /# HELP cron_app_basic_endtime Unix time in microseconds./ }
  its('content') { should match /# TYPE cron_app_basic_endtime gauge/ }
  its('content') { should match /cron_app_basic_endtime{user="app",promcron_name="app_basic",promcron="endtime"} [0-9]{10}\.[0-9]{3}$/ }
  its('content') { should match /# HELP cron_app_basic Process return code./ }
  its('content') { should match /# TYPE cron_app_basic gauge/ }
  its('content') { should match /cron_app_basic{user="app",promcron_name="app_basic",promcron="value"} 0/ }
  its('size') { should > 200 }
  it { should_not be_more_permissive_than('0664') }
  its('owner') { should eq 'app' }
  its('group') { should eq 'root' }
end

# Remove prom file
describe command('sudo rm -f /opt/prometheus/etc/node_exporter_textfiles/cron_app_basic.prom*') do
  its('exit_status') { should eq 0 }
end
