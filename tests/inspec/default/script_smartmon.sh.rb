# encoding: utf-8
# author: Mesaguy

describe file('/opt/prometheus/scripts/smartmon.sh') do
    it { should be_file }
    it { should be_executable }
    its('size') { should > 6500 }
    its('mode') { should cmp '0555' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end
