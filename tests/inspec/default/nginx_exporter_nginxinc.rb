# encoding: utf-8
# author: Mesaguy

describe file('/opt/prometheus/exporters/nginx_exporter_nginxinc/active') do
    it { should be_symlink }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe file('/opt/prometheus/exporters/nginx_exporter_nginxinc/active/nginx-prometheus-exporter') do
    it { should be_file }
    it { should be_executable }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end

describe service('nginx_exporter_nginxinc') do
    it { should be_enabled }
    it { should be_installed }
end
