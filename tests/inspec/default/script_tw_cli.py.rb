# encoding: utf-8
# author: Mesaguy

describe file('/opt/prometheus/scripts/tw_cli.py') do
    it { should be_file }
    it { should be_executable }
    its('size') { should > 9000 }
    its('mode') { should cmp '0555' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end
