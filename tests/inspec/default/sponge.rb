# encoding: utf-8
# author: Mesaguy

# Ensure the 'sponge' command is present

#describe os.name do
#  it { should eq 'name' }
#end

#describe os.family do
#  it { should eq 'family' }
#end

#describe os.release do
#  it { should eq 'release' }
#end

if os.name == 'alpine' and os.release.match('^3\.[0-8]\..*')
    # Unsupported
elsif os.name == 'amazon' and ['2', '2016.09', '2017.03', '2017.09', '2018.03'].include?(os.release)
    # Unsupported
elsif os.family == 'redhat' and os.release.match('^[6-8]\..*')
    # Unsupported
elsif os.family == 'suse' and ['13.1', '13.2', '42.1', '42.2', '42.3'].include?(os.release)
    # Unsupported
else
    describe command('which sponge') do
        its('stdout') { should match /bin/ }
        its('stderr') { should eq '' }
        its('exit_status') { should eq 0 }
    end
end
