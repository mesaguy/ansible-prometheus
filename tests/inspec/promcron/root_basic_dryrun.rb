# Cron prom file does not exist
describe file('/opt/prometheus/etc/node_exporter_textfiles/cron_root_dryrun.prom') do
  it { should_not exist }
end

# Run in dryrun mode, should not create a file
describe command('ls > /dev/null ; sudo promcron -D root_dryrun $?') do
  its('exit_status') { should eq 0 }
  its('stderr') { should eq '' }
  its('stdout') { should match /\[DRYRUN\] # HELP cron_root_dryrun_endtime Unix time in microseconds./ }
  its('stdout') { should match /\[DRYRUN\] # TYPE cron_root_dryrun_endtime gauge/ }
  its('stdout') { should match /\[DRYRUN\] cron_root_dryrun_endtime{user="root",promcron_name="root_dryrun",promcron="endtime"} [0-9]{10}\.[0-9]{3}$/ }
  its('stdout') { should match /\[DRYRUN\] # HELP cron_root_dryrun Process return code./ }
  its('stdout') { should match /\[DRYRUN\] # TYPE cron_root_dryrun gauge/ }
  its('stdout') { should match /\[DRYRUN\] cron_root_dryrun{user="root",promcron_name="root_dryrun",promcron="value"} 0/ }
end

# Cron prom file does not exist
describe file('/opt/prometheus/etc/node_exporter_textfiles/cron_root_dryrun.prom') do
  it { should_not exist }
end

# Remove prom file (so other tests pass even if this fails)
describe command('sudo rm -f /opt/prometheus/etc/node_exporter_textfiles/cron_root_dryrun.prom*') do
  its('exit_status') { should eq 0 }
end
