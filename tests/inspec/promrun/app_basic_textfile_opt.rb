# Cron prom file does not exist
describe file('/tmp/promrun_app_textfile_dir.prom') do
  it { should_not exist }
end

# Creates the prom file in specified textfile directory, /tmp
describe command('sudo -u app promrun -n app_textfile_dir -t /tmp ls /tmp > /dev/null') do
  its('exit_status') { should eq 0 }
  its('stderr') { should eq '' }
  its('stdout') { should eq '' }
end

## Resulting prom file is as expected
describe file('/tmp/promrun_app_textfile_dir.prom') do
  it { should be_file }
  its('content') { should match /# HELP promrun_app_textfile_dir_starttime Start time in Unix time with microseconds./ }
  its('content') { should match /# TYPE promrun_app_textfile_dir_starttime gauge/ }
  its('content') { should match /promrun_app_textfile_dir_starttime\{user="app",promrun_name="app_textfile_dir",promrun="starttime"\} [0-9]{10}\.[0-9]{3}$/ }
  its('content') { should match /# HELP promrun_app_textfile_dir_cpu_kernel_mode_seconds Total number of CPU-seconds that the process spent in kernel mode./ }
  its('content') { should match /# TYPE promrun_app_textfile_dir_cpu_kernel_mode_seconds gauge/ }
  its('content') { should match /promrun_app_textfile_dir_cpu_kernel_mode_seconds\{user="app"\} 0.00/ }
  its('content') { should match /# HELP promrun_app_textfile_dir_elapsed_seconds Elapsed real time \(in seconds\)\./ }
  its('content') { should match /# TYPE promrun_app_textfile_dir_elapsed_seconds gauge/ }
  its('content') { should match /promrun_app_textfile_dir_elapsed_seconds\{user="app"\} 0\.[0-9]+/ }
  its('content') { should match /# HELP promrun_app_textfile_dir_cpu_user_mode_seconds Total number of CPU-seconds that the process spent in user mode./ }
  its('content') { should match /# TYPE promrun_app_textfile_dir_cpu_user_mode_seconds gauge/ }
  its('content') { should match /promrun_app_textfile_dir_cpu_user_mode_seconds\{user="app"\} 0.00/ }
  its('content') { should match /# HELP promrun_app_textfile_dir_max_resident_memory_kb Maximum resident set size of the process during its lifetime, in Kbytes./ }
  its('content') { should match /# TYPE promrun_app_textfile_dir_max_resident_memory_kb gauge/ }
  its('content') { should match /promrun_app_textfile_dir_max_resident_memory_kb\{user="app"\} [0-9]+/ }
  its('content') { should match /# HELP promrun_app_textfile_dir_avg_total_memory_kb Average total \(data\+stack\+text\) memory use of the process, in Kbytes./ }
  its('content') { should match /# TYPE promrun_app_textfile_dir_avg_total_memory_kb gauge/ }
  its('content') { should match /promrun_app_textfile_dir_avg_total_memory_kb\{user="app"\} 0/ }
  its('content') { should match /# HELP promrun_app_textfile_dir_swapped_from_main_memory_count Number of times the process was swapped out of main memory./ }
  its('content') { should match /# TYPE promrun_app_textfile_dir_swapped_from_main_memory_count gauge/ }
  its('content') { should match /promrun_app_textfile_dir_swapped_from_main_memory_count\{user="app"\} 0/ }
  its('content') { should match /# HELP promrun_app_textfile_dir_signals_delivered_to_process_count Number of signals delivered to the process./ }
  its('content') { should match /# TYPE promrun_app_textfile_dir_signals_delivered_to_process_count gauge/ }
  its('content') { should match /promrun_app_textfile_dir_signals_delivered_to_process_count\{user="app"\} 0/ }
  its('content') { should match /# HELP promrun_app_textfile_dir_context_switch_count_involuntary_count Number of times the process was context-switched involuntarily \(because the time slice expired\)./ }
  its('content') { should match /# TYPE promrun_app_textfile_dir_context_switch_count_involuntary_count gauge/ }
  its('content') { should match /promrun_app_textfile_dir_context_switch_count_involuntary_count\{user="app"\} [0-9]+/ }
  its('content') { should match /# HELP promrun_app_textfile_dir_context_switch_count_voluntary_count Number of waits, times that the program was context-switched voluntarily, for instance while waiting for an I\/O operation to complete./ }
  its('content') { should match /# TYPE promrun_app_textfile_dir_context_switch_count_voluntary_count gauge/ }
  its('content') { should match /promrun_app_textfile_dir_context_switch_count_voluntary_count\{user="app"\} [0-9]+/ }
  its('content') { should match /# HELP promrun_app_textfile_dir_filesystem_inputs_count Number of filesystem inputs by the process./ }
  its('content') { should match /# TYPE promrun_app_textfile_dir_filesystem_inputs_count gauge/ }
  its('content') { should match /promrun_app_textfile_dir_filesystem_inputs_count\{user="app"\} [0-9]+/ }
  its('content') { should match /# HELP promrun_app_textfile_dir_filesystem_outputs_count Number of filesystem outputs by the process./ }
  its('content') { should match /# TYPE promrun_app_textfile_dir_filesystem_outputs_count gauge/ }
  its('content') { should match /promrun_app_textfile_dir_filesystem_outputs_count\{user="app"\} 0/ }
  its('content') { should match /# HELP promrun_app_textfile_dir_socket_messages_received_count Number of socket messages received by the process./ }
  its('content') { should match /# TYPE promrun_app_textfile_dir_socket_messages_received_count gauge/ }
  its('content') { should match /promrun_app_textfile_dir_socket_messages_received_count\{user="app"\} 0/ }
  its('content') { should match /# HELP promrun_app_textfile_dir_socket_messages_sent_count Number of socket messages sent by the process./ }
  its('content') { should match /# TYPE promrun_app_textfile_dir_socket_messages_sent_count gauge/ }
  its('content') { should match /promrun_app_textfile_dir_socket_messages_sent_count\{user="app"\} 0/ }
  its('content') { should match /# HELP promrun_app_textfile_dir_exit_status Exit status of the command./ }
  its('content') { should match /# TYPE promrun_app_textfile_dir_exit_status gauge/ }
  its('content') { should match /promrun_app_textfile_dir_exit_status\{user="app",promrun_name="app_textfile_dir",promrun="exit"\} 0/ }
  its('content') { should match /# HELP promrun_app_textfile_dir_process_avg_size_resident_set_kb Average resident set size of the process, in Kbytes./ }
  its('content') { should match /# TYPE promrun_app_textfile_dir_process_avg_size_resident_set_kb gauge/ }
  its('content') { should match /promrun_app_textfile_dir_process_avg_size_resident_set_kb\{user="app"\} 0/ }
  its('content') { should match /# HELP promrun_app_textfile_dir_process_avg_size_unshared_data_area_kb Average size of the process's unshared data area, in Kbytes./ }
  its('content') { should match /# TYPE promrun_app_textfile_dir_process_avg_size_unshared_data_area_kb gauge/ }
  its('content') { should match /promrun_app_textfile_dir_process_avg_size_unshared_data_area_kb\{user="app"\} 0/ }
  its('content') { should match /# HELP promrun_app_textfile_dir_process_avg_size_unshared_stack_space_kb Average size of the process's unshared stack space, in Kbytes./ }
  its('content') { should match /# TYPE promrun_app_textfile_dir_process_avg_size_unshared_stack_space_kb gauge/ }
  its('content') { should match /promrun_app_textfile_dir_process_avg_size_unshared_stack_space_kb\{user="app"\} 0/ }
  its('content') { should match /# HELP promrun_app_textfile_dir_process_avg_size_shared_text_space_kb Average size of the process's shared text space, in Kbytes./ }
  its('content') { should match /# TYPE promrun_app_textfile_dir_process_avg_size_shared_text_space_kb gauge/ }
  its('content') { should match /promrun_app_textfile_dir_process_avg_size_shared_text_space_kb\{user="app"\} 0/ }
  its('content') { should match /# HELP promrun_app_textfile_dir_major_page_fault_count Number of major page faults that occurred while the process was running. These are faults where the page has to be read in from disk./ }
  its('content') { should match /# TYPE promrun_app_textfile_dir_major_page_fault_count gauge/ }
  its('content') { should match /promrun_app_textfile_dir_major_page_fault_count\{user="app"\} [0-9]+/ }
  its('content') { should match /# HELP promrun_app_textfile_dir_minor_page_fault_count Number of minor, or recoverable, page faults. These are faults for pages that are not valid but which have not yet been claimed by other virtual pages. Thus the data in the page is still valid but the system tables must be updated./ }
  its('content') { should match /# TYPE promrun_app_textfile_dir_minor_page_fault_count gauge/ }
  its('content') { should match /promrun_app_textfile_dir_minor_page_fault_count\{user="app"\} [0-9]+/ }
  its('content') { should match /# HELP promrun_app_textfile_dir_command Name and command-line arguments of the command being timed. See Label./ }
  its('content') { should match /# TYPE promrun_app_textfile_dir_command gauge/ }
  its('content') { should match /promrun_app_textfile_dir_command\{user="app",command="ls \/tmp"\} 1/ }
  its('content') { should match /# HELP promrun_app_textfile_dir_endtime End time in Unix time with microseconds./ }
  its('content') { should match /# TYPE promrun_app_textfile_dir_endtime gauge/ }
  its('content') { should match /promrun_app_textfile_dir_endtime\{user="app",promrun_name="app_textfile_dir",promrun="endtime"\} [0-9]{10}\.[0-9]{3}$/ }
  its('size') { should > 200 }
  it { should_not be_more_permissive_than('0664') }
  its('owner') { should eq 'app' }
  its('group') { should eq 'app' }
end
describe command('wc -l /tmp/promrun_app_textfile_dir.prom') do
  its('exit_status') { should eq 0 }
  its('stderr') { should eq '' }
  its('stdout') { should match /^70 / }
end

# Remove prom file
describe command('sudo rm -f /tmp/promrun_app_textfile_dir.prom*') do
  its('exit_status') { should eq 0 }
end
