# Cron prom file does not exist
describe file('/opt/prometheus/etc/node_exporter_textfiles/cron_root_advanced.prom') do
  it { should_not exist }
end
describe file('/opt/prometheus/etc/node_exporter_textfiles/cron_root_advanced.1.prom') do
  it { should_not exist }
end

# Creates the prom file
describe command('ls > /dev/null ; sudo promcron -l org=Test -d "RUN OF ls COMMAND" -i 1 -l env=test root_advanced $?') do
  its('exit_status') { should eq 0 }
  its('stderr') { should eq '' }
  its('stdout') { should eq '' }
end

# Resulting prom file is as expected
describe file('/opt/prometheus/etc/node_exporter_textfiles/cron_root_advanced.1.prom') do
  it { should be_file }
  its('content') { should match /# HELP cron_root_advanced_endtime Unix time in microseconds./ }
  its('content') { should match /# TYPE cron_root_advanced_endtime gauge/ }
  its('content') { should match /cron_root_advanced_endtime{org="Test",env="test",user="root",description="RUN OF ls COMMAND",promcron_name="root_advanced",promcron="endtime"} [0-9]{10}\.[0-9]{3}$/ }
  its('content') { should match /# HELP cron_root_advanced Process return code./ }
  its('content') { should match /# TYPE cron_root_advanced gauge/ }
  its('content') { should match /cron_root_advanced{org="Test",env="test",user="root",description="RUN OF ls COMMAND",promcron_name="root_advanced",promcron="value"} 0/ }
  its('size') { should > 200 }
  it { should_not be_more_permissive_than('0664') }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
end

# Run command again, this time in verbose mode
describe command('ls > /dev/null ; sudo promcron -v -l org=Test -d "RUN OF ls COMMAND" -l env=test root_advanced $?') do
  its('exit_status') { should eq 0 }
  its('stderr') { should eq '' }
  its('stdout') { should match /# HELP cron_root_advanced_endtime Unix time in microseconds./ }
  its('stdout') { should match /# TYPE cron_root_advanced_endtime gauge/ }
  its('stdout') { should match /cron_root_advanced_endtime{org="Test",env="test",user="root",description="RUN OF ls COMMAND",promcron_name="root_advanced",promcron="endtime"} [0-9]{10}\.[0-9]{3}$/ }
  its('stdout') { should match /# HELP cron_root_advanced Process return code./ }
  its('stdout') { should match /# TYPE cron_root_advanced gauge/ }
  its('stdout') { should match /cron_root_advanced{org="Test",env="test",user="root",description="RUN OF ls COMMAND",promcron_name="root_advanced",promcron="value"} 0/ }
end

# Resulting prom file is as expected
describe file('/opt/prometheus/etc/node_exporter_textfiles/cron_root_advanced.prom') do
  it { should be_file }
  its('content') { should match /# HELP cron_root_advanced_endtime Unix time in microseconds./ }
  its('content') { should match /# TYPE cron_root_advanced_endtime gauge/ }
  its('content') { should match /cron_root_advanced_endtime{org="Test",env="test",user="root",description="RUN OF ls COMMAND",promcron_name="root_advanced",promcron="endtime"} [0-9]{10}\.[0-9]{3}$/ }
  its('content') { should match /# HELP cron_root_advanced Process return code./ }
  its('content') { should match /# TYPE cron_root_advanced gauge/ }
  its('content') { should match /cron_root_advanced{org="Test",env="test",user="root",description="RUN OF ls COMMAND",promcron_name="root_advanced",promcron="value"} 0/ }
  its('size') { should > 200 }
  it { should_not be_more_permissive_than('0664') }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
end

# Remove prom file
describe command('sudo rm -f /opt/prometheus/etc/node_exporter_textfiles/cron_root_advanced.prom*') do
  its('exit_status') { should eq 0 }
end
