# Cron prom file does not exist
describe file('/etc/prometheus/node_exporter_textfiles/cron_root_debug.prom') do
  it { should_not exist }
end

# Run in debug mode, should not create a file
describe command('ls > /dev/null ; sudo promcron -D root_debug $?') do
  its('exit_status') { should eq 0 }
  its('stderr') { should eq '' }
  its('stdout') { should match /\[DRYRUN\] # HELP cron_root_debug_endtime Unix time in microseconds./ }
  its('stdout') { should match /\[DRYRUN\] # TYPE cron_root_debug_endtime gauge/ }
  its('stdout') { should match /\[DRYRUN\] cron_root_debug_endtime{user="root",job_type="cron_time"}/ }
  its('stdout') { should match /\[DRYRUN\] # HELP cron_root_debug Process return code./ }
  its('stdout') { should match /\[DRYRUN\] # TYPE cron_root_debug gauge/ }
  its('stdout') { should match /\[DRYRUN\] cron_root_debug{user="root",job_type="cron"} 0/ }
end

# Cron prom file does not exist
describe file('/etc/prometheus/node_exporter_textfiles/cron_root_debug.prom') do
  it { should_not exist }
end

# Remove prom file (so other tests pass even if this fails)
describe command('sudo rm -f /etc/prometheus/node_exporter_textfiles/cron_root_debug.prom') do
  its('exit_status') { should eq 0 }
end
