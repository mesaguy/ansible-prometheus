# encoding: utf-8
# author: Mesaguy

# Ensure the 'sponge' command is present
describe command('which sponge') do
    its('stdout') { should match /bin/ }
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
end
