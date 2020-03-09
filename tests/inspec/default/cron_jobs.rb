# Ensure orphaned cron file has been removed:
describe file('/etc/cron.d/prometheus_script_orphan') do
  it { should_not exist }
end

if os.name == 'alpine'
    # Unsupported
else
    # Test the 2 crontabs created while testing:
    describe command('sudo crontab -u root -l') do
      its('exit_status') { should eq 0 }
      its('stderr') { should eq '' }
      its('stdout') { should match /#Ansible: Run Prometheus script echo test1/ }
      its('stdout') { should match /\* \* \* \* \* \/opt\/prometheus\/scripts\/echo test1 (>|\| sponge) \/opt\/prometheus\/etc\/node_exporter_textfiles\/echo_test1.prom/ }
    end
    describe command('sudo crontab -u prometheus -l') do
      its('exit_status') { should eq 0 }
      its('stderr') { should eq '' }
      its('stdout') { should match /#Ansible: Run Prometheus script echo test2/ }
      its('stdout') { should match /10 1 1 8 4 \/opt\/prometheus\/scripts\/echo test2 (>|\| sponge) \/opt\/prometheus\/etc\/node_exporter_textfiles\/echo_test2.prom/ }
    end

    # Test the 2 cron files created while testing:
    describe file('/etc/cron.d/prometheus_script_echo_test3') do
      it { should be_file }
      its('owner') { should eq 'root' }
      its('group') { should eq 'root' }
      its('mode') { should cmp '0644' }
      its('content') { /PATH="\/usr\/bin:\/usr\/sbin:\/bin:\/sbin"/ }
      its('content') { /#Ansible: Run Prometheus script echo test3/ }
      its('content') { /\* \* \* \* \* prometheus \/opt\/prometheus\/scripts\/echo test3 (>|\| sponge) \/opt\/prometheus\/etc\/node_exporter_textfiles\/echo_test3.prom/ }
    end
    describe file('/etc/cron.d/prometheus_script_echo_test4') do
      it { should be_file }
      its('owner') { should eq 'root' }
      its('group') { should eq 'root' }
      its('mode') { should cmp '0644' }
      its('content') { /PATH="\/usr\/bin:\/usr\/sbin:\/bin:\/sbin"/ }
      its('content') { /#Ansible: Run Prometheus script echo test4/ }
      its('content') { /\* \* \* \* \* root \/opt\/prometheus\/scripts\/echo test4 (>|\| sponge) \/opt\/prometheus\/etc\/node_exporter_textfiles\/echo_test4.prom/ }
    end
end
