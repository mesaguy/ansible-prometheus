# Cron prom file does not exist
describe file('/etc/prometheus/node_exporter_textfiles/cron_root_advanced.prom') do
  it { should_not exist }
end

# Creates the prom file
describe command('ls > /dev/null ; sudo promcron -l org=Test -d "RUN OF ls COMMAND" -l env=test root_advanced $?') do
  its('exit_status') { should eq 0 }
  its('stderr') { should eq '' }
  its('stdout') { should eq '' }
end

# Resulting prom file is as expected
describe file('/etc/prometheus/node_exporter_textfiles/cron_root_advanced.prom') do
  it { should be_file }
  its('content') { should match /# HELP cron_root_advanced_endtime Unix time in microseconds./ }
  its('content') { should match /# TYPE cron_root_advanced_endtime gauge/ }
  its('content') { should match /cron_root_advanced_endtime{org="Test",env="test",user="root",description="RUN OF ls COMMAND",job_type="cron_time"}/ }
  its('content') { should match /# HELP cron_root_advanced Process return code./ }
  its('content') { should match /# TYPE cron_root_advanced gauge/ }
  its('content') { should match /cron_root_advanced{org="Test",env="test",user="root",description="RUN OF ls COMMAND",job_type="cron"} 0/ }
  its('size') { should > 200 }
  its('mode') { should cmp '0644' }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
end

# Run command again, this time in verbose mode
describe command('ls > /dev/null ; sudo promcron -v -l org=Test -d "RUN OF ls COMMAND" -l env=test root_advanced $?') do
  its('exit_status') { should eq 0 }
  its('stderr') { should eq '' }
  its('stdout') { should match /# HELP cron_root_advanced_endtime Unix time in microseconds./ }
  its('stdout') { should match /# TYPE cron_root_advanced_endtime gauge/ }
  its('stdout') { should match /cron_root_advanced_endtime{org="Test",env="test",user="root",description="RUN OF ls COMMAND",job_type="cron_time"}/ }
  its('stdout') { should match /# HELP cron_root_advanced Process return code./ }
  its('stdout') { should match /# TYPE cron_root_advanced gauge/ }
  its('stdout') { should match /cron_root_advanced{org="Test",env="test",user="root",description="RUN OF ls COMMAND",job_type="cron"} 0/ }
end

# Resulting prom file is as expected
describe file('/etc/prometheus/node_exporter_textfiles/cron_root_advanced.prom') do
  it { should be_file }
  its('content') { should match /# HELP cron_root_advanced_endtime Unix time in microseconds./ }
  its('content') { should match /# TYPE cron_root_advanced_endtime gauge/ }
  its('content') { should match /cron_root_advanced_endtime{org="Test",env="test",user="root",description="RUN OF ls COMMAND",job_type="cron_time"}/ }
  its('content') { should match /# HELP cron_root_advanced Process return code./ }
  its('content') { should match /# TYPE cron_root_advanced gauge/ }
  its('content') { should match /cron_root_advanced{org="Test",env="test",user="root",description="RUN OF ls COMMAND",job_type="cron"} 0/ }
  its('size') { should > 200 }
  its('mode') { should cmp '0644' }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
end

# Remove prom file
describe command('sudo rm -f /etc/prometheus/node_exporter_textfiles/cron_root_advanced.prom') do
  its('exit_status') { should eq 0 }
end
