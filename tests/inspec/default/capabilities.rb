# encoding: utf-8
# author: Mesaguy

# Ensure the 'setcap' command is present

#describe os.name do
#  it { should eq 'name' }
#end

#describe os.family do
#  it { should eq 'family' }
#end

#describe os.release do
#  it { should eq 'release' }
#end

if os.name == 'alpine'
    # Unsupported
elsif os.name == 'amazon' and ['2018.03'].include?(os.release)
    # Unsupported
#elsif os.name == 'amazon' and ['2', '2016.09', '2017.03', '2017.09', '2018.03'].include?(os.release)
#    # Unsupported
#elsif os.family == 'redhat' and os.release.match('^6.*')
#    # Unsupported
#elsif os.family == 'suse' and ['13.1', '13.2', '42.1'].include?(os.release)
#    # Unsupported
else
    describe command('which setcap') do
        its('stdout') { should match /bin/ }
        its('stderr') { should eq '' }
        its('exit_status') { should eq 0 }
    end
end
