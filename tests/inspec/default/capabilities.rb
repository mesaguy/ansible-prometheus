# encoding: utf-8
# author: Mesaguy

# Ensure the 'setcap' command is present

describe command('PATH=/usr/bin:/usr/sbin:/bin:/sbin which setcap') do
    its('stdout') { should match /bin/ }
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
end
