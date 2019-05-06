# encoding: utf-8
# author: Mesaguy

describe file('/opt/prometheus/scripts/inotify-instances') do
    it { should be_file }
    it { should be_executable }
    its('content') { should match /No metrics will be exposed for processes that do not hold any inotify fds/ }
    its('size') { should > 3400 }
    its('mode') { should cmp '0555' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end
