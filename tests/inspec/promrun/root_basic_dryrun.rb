# Cron prom file does not exist
describe file('/opt/prometheus/etc/node_exporter_textfiles/promrun_root_dryrun.prom') do
  it { should_not exist }
end

# Run in dryrun mode, should not create a file
describe command('sudo promrun -D -n root_dryrun ls /tmp > /dev/null') do
  its('exit_status') { should eq 0 }
  its('stdout') { should eq '' }
  its('stderr') { should match /\[DRYRUN\] # HELP promrun_root_dryrun_starttime Start time in Unix time with microseconds./ }
  its('stderr') { should match /\[DRYRUN\] # TYPE promrun_root_dryrun_starttime gauge/ }
  its('stderr') { should match /\[DRYRUN\] promrun_root_dryrun_starttime\{user="root",promrun_name="root_dryrun",promrun="starttime"\} [0-9]{10}\.[0-9]{3}$/ }
  its('stderr') { should match /\[DRYRUN\] # HELP promrun_root_dryrun_cpu_kernel_mode_seconds Total number of CPU-seconds that the process spent in kernel mode./ }
  its('stderr') { should match /\[DRYRUN\] # TYPE promrun_root_dryrun_cpu_kernel_mode_seconds gauge/ }
  its('stderr') { should match /\[DRYRUN\] promrun_root_dryrun_cpu_kernel_mode_seconds\{user="root"\} 0.00/ }
  its('stderr') { should match /\[DRYRUN\] # HELP promrun_root_dryrun_elapsed_seconds Elapsed real time \(in seconds\)\./ }
  its('stderr') { should match /\[DRYRUN\] # TYPE promrun_root_dryrun_elapsed_seconds gauge/ }
  its('stderr') { should match /\[DRYRUN\] promrun_root_dryrun_elapsed_seconds\{user="root"\} 0\.[0-9]+/ }
  its('stderr') { should match /\[DRYRUN\] # HELP promrun_root_dryrun_cpu_user_mode_seconds Total number of CPU-seconds that the process spent in user mode./ }
  its('stderr') { should match /\[DRYRUN\] # TYPE promrun_root_dryrun_cpu_user_mode_seconds gauge/ }
  its('stderr') { should match /\[DRYRUN\] promrun_root_dryrun_cpu_user_mode_seconds\{user="root"\} 0.00/ }
  its('stderr') { should match /\[DRYRUN\] # HELP promrun_root_dryrun_max_resident_memory_kb Maximum resident set size of the process during its lifetime, in Kbytes./ }
  its('stderr') { should match /\[DRYRUN\] # TYPE promrun_root_dryrun_max_resident_memory_kb gauge/ }
  its('stderr') { should match /\[DRYRUN\] promrun_root_dryrun_max_resident_memory_kb\{user="root"\} [0-9]+/ }
  its('stderr') { should match /\[DRYRUN\] # HELP promrun_root_dryrun_avg_total_memory_kb Average total \(data\+stack\+text\) memory use of the process, in Kbytes./ }
  its('stderr') { should match /\[DRYRUN\] # TYPE promrun_root_dryrun_avg_total_memory_kb gauge/ }
  its('stderr') { should match /\[DRYRUN\] promrun_root_dryrun_avg_total_memory_kb\{user="root"\} 0/ }
  its('stderr') { should match /\[DRYRUN\] # HELP promrun_root_dryrun_swapped_from_main_memory_count Number of times the process was swapped out of main memory./ }
  its('stderr') { should match /\[DRYRUN\] # TYPE promrun_root_dryrun_swapped_from_main_memory_count gauge/ }
  its('stderr') { should match /\[DRYRUN\] promrun_root_dryrun_swapped_from_main_memory_count\{user="root"\} 0/ }
  its('stderr') { should match /\[DRYRUN\] # HELP promrun_root_dryrun_signals_delivered_to_process_count Number of signals delivered to the process./ }
  its('stderr') { should match /\[DRYRUN\] # TYPE promrun_root_dryrun_signals_delivered_to_process_count gauge/ }
  its('stderr') { should match /\[DRYRUN\] promrun_root_dryrun_signals_delivered_to_process_count\{user="root"\} 0/ }
  its('stderr') { should match /\[DRYRUN\] # HELP promrun_root_dryrun_context_switch_count_involuntary_count Number of times the process was context-switched involuntarily \(because the time slice expired\)./ }
  its('stderr') { should match /\[DRYRUN\] # TYPE promrun_root_dryrun_context_switch_count_involuntary_count gauge/ }
  its('stderr') { should match /\[DRYRUN\] promrun_root_dryrun_context_switch_count_involuntary_count\{user="root"\} [0-9]+/ }
  its('stderr') { should match /\[DRYRUN\] # HELP promrun_root_dryrun_context_switch_count_voluntary_count Number of waits, times that the program was context-switched voluntarily, for instance while waiting for an I\/O operation to complete./ }
  its('stderr') { should match /\[DRYRUN\] # TYPE promrun_root_dryrun_context_switch_count_voluntary_count gauge/ }
  its('stderr') { should match /\[DRYRUN\] promrun_root_dryrun_context_switch_count_voluntary_count\{user="root"\} [0-9]+/ }
  its('stderr') { should match /\[DRYRUN\] # HELP promrun_root_dryrun_filesystem_inputs_count Number of filesystem inputs by the process./ }
  its('stderr') { should match /\[DRYRUN\] # TYPE promrun_root_dryrun_filesystem_inputs_count gauge/ }
  its('stderr') { should match /\[DRYRUN\] promrun_root_dryrun_filesystem_inputs_count\{user="root"\} [0-9]+/ }
  its('stderr') { should match /\[DRYRUN\] # HELP promrun_root_dryrun_filesystem_outputs_count Number of filesystem outputs by the process./ }
  its('stderr') { should match /\[DRYRUN\] # TYPE promrun_root_dryrun_filesystem_outputs_count gauge/ }
  its('stderr') { should match /\[DRYRUN\] promrun_root_dryrun_filesystem_outputs_count\{user="root"\} 0/ }
  its('stderr') { should match /\[DRYRUN\] # HELP promrun_root_dryrun_socket_messages_received_count Number of socket messages received by the process./ }
  its('stderr') { should match /\[DRYRUN\] # TYPE promrun_root_dryrun_socket_messages_received_count gauge/ }
  its('stderr') { should match /\[DRYRUN\] promrun_root_dryrun_socket_messages_received_count\{user="root"\} 0/ }
  its('stderr') { should match /\[DRYRUN\] # HELP promrun_root_dryrun_socket_messages_sent_count Number of socket messages sent by the process./ }
  its('stderr') { should match /\[DRYRUN\] # TYPE promrun_root_dryrun_socket_messages_sent_count gauge/ }
  its('stderr') { should match /\[DRYRUN\] promrun_root_dryrun_socket_messages_sent_count\{user="root"\} 0/ }
  its('stderr') { should match /\[DRYRUN\] # HELP promrun_root_dryrun_exit_status Exit status of the command./ }
  its('stderr') { should match /\[DRYRUN\] # TYPE promrun_root_dryrun_exit_status gauge/ }
  its('stderr') { should match /\[DRYRUN\] promrun_root_dryrun_exit_status\{user="root",promrun_name="root_dryrun",promrun="exit"\} 0/ }
  its('stderr') { should match /\[DRYRUN\] # HELP promrun_root_dryrun_process_avg_size_resident_set_kb Average resident set size of the process, in Kbytes./ }
  its('stderr') { should match /\[DRYRUN\] # TYPE promrun_root_dryrun_process_avg_size_resident_set_kb gauge/ }
  its('stderr') { should match /\[DRYRUN\] promrun_root_dryrun_process_avg_size_resident_set_kb\{user="root"\} 0/ }
  its('stderr') { should match /\[DRYRUN\] # HELP promrun_root_dryrun_process_avg_size_unshared_data_area_kb Average size of the process's unshared data area, in Kbytes./ }
  its('stderr') { should match /\[DRYRUN\] # TYPE promrun_root_dryrun_process_avg_size_unshared_data_area_kb gauge/ }
  its('stderr') { should match /\[DRYRUN\] promrun_root_dryrun_process_avg_size_unshared_data_area_kb\{user="root"\} 0/ }
  its('stderr') { should match /\[DRYRUN\] # HELP promrun_root_dryrun_process_avg_size_unshared_stack_space_kb Average size of the process's unshared stack space, in Kbytes./ }
  its('stderr') { should match /\[DRYRUN\] # TYPE promrun_root_dryrun_process_avg_size_unshared_stack_space_kb gauge/ }
  its('stderr') { should match /\[DRYRUN\] promrun_root_dryrun_process_avg_size_unshared_stack_space_kb\{user="root"\} 0/ }
  its('stderr') { should match /\[DRYRUN\] # HELP promrun_root_dryrun_process_avg_size_shared_text_space_kb Average size of the process's shared text space, in Kbytes./ }
  its('stderr') { should match /\[DRYRUN\] # TYPE promrun_root_dryrun_process_avg_size_shared_text_space_kb gauge/ }
  its('stderr') { should match /\[DRYRUN\] promrun_root_dryrun_process_avg_size_shared_text_space_kb\{user="root"\} 0/ }
  its('stderr') { should match /\[DRYRUN\] # HELP promrun_root_dryrun_major_page_fault_count Number of major page faults that occurred while the process was running. These are faults where the page has to be read in from disk./ }
  its('stderr') { should match /\[DRYRUN\] # TYPE promrun_root_dryrun_major_page_fault_count gauge/ }
  its('stderr') { should match /\[DRYRUN\] promrun_root_dryrun_major_page_fault_count\{user="root"\} [0-9]+/ }
  its('stderr') { should match /\[DRYRUN\] # HELP promrun_root_dryrun_minor_page_fault_count Number of minor, or recoverable, page faults. These are faults for pages that are not valid but which have not yet been claimed by other virtual pages. Thus the data in the page is still valid but the system tables must be updated./ }
  its('stderr') { should match /\[DRYRUN\] # TYPE promrun_root_dryrun_minor_page_fault_count gauge/ }
  its('stderr') { should match /\[DRYRUN\] promrun_root_dryrun_minor_page_fault_count\{user="root"\} [0-9]+/ }
  its('stderr') { should match /\[DRYRUN\] # HELP promrun_root_dryrun_command Name and command-line arguments of the command being timed. See Label./ }
  its('stderr') { should match /\[DRYRUN\] # TYPE promrun_root_dryrun_command gauge/ }
  its('stderr') { should match /\[DRYRUN\] promrun_root_dryrun_command\{user="root",command="ls \/tmp"\} 1/ }
  its('stderr') { should match /\[DRYRUN\] # HELP promrun_root_dryrun_endtime End time in Unix time with microseconds./ }
  its('stderr') { should match /\[DRYRUN\] # TYPE promrun_root_dryrun_endtime gauge/ }
  its('stderr') { should match /\[DRYRUN\] promrun_root_dryrun_endtime\{user="root",promrun_name="root_dryrun",promrun="endtime"\} [0-9]{10}\.[0-9]{3}$/ }
  its('stderr') { should match /\[DRYRUN\] cp -fp "\/opt\/prometheus\/etc\/node_exporter_textfiles\/promrun_root_dryrun.prom.tmp" "\/opt\/prometheus\/etc\/node_exporter_textfiles\/promrun_root_dryrun.prom"/ }
end

# Cron prom file does not exist
describe file('/opt/prometheus/etc/node_exporter_textfiles/promrun_root_dryrun.prom') do
  it { should_not exist }
end

# Remove prom file (so other tests pass even if this fails)
describe command('sudo rm -f /opt/prometheus/etc/node_exporter_textfiles/promrun_root_dryrun.prom*') do
  its('exit_status') { should eq 0 }
end
