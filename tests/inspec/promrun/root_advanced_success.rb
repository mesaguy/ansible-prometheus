# prom file does not exist
describe file('/opt/prometheus/etc/node_exporter_textfiles/promrun_root_advanced.prom') do
  it { should_not exist }
end
describe file('/opt/prometheus/etc/node_exporter_textfiles/promrun_root_advanced.1.prom') do
  it { should_not exist }
end
describe file('/opt/prometheus/etc/node_exporter_textfiles/promrun_root_advanced_verbose.prom') do
  it { should_not exist }
end

# Creates the prom file
describe command('sudo promrun -l org=Test -d "RUN OF echo COMMAND" -i 1 -l env=test -n root_advanced echo -n 123') do
  its('exit_status') { should eq 0 }
  its('stderr') { should eq '' }
  its('stdout') { should eq '123' }
end

# Resulting prom file is as expected
describe file('/opt/prometheus/etc/node_exporter_textfiles/promrun_root_advanced.1.prom') do
  it { should be_file }
  its('content') { should match /# HELP promrun_root_advanced_starttime Start time in Unix time with microseconds./ }
  its('content') { should match /# TYPE promrun_root_advanced_starttime gauge/ }
  its('content') { should match /promrun_root_advanced_starttime\{org="Test",env="test",user="root",description="RUN OF echo COMMAND",promrun_name="root_advanced",promrun="starttime"\} [0-9]{10}\.[0-9]{3}$/ }
  its('content') { should match /# HELP promrun_root_advanced_cpu_kernel_mode_seconds Total number of CPU-seconds that the process spent in kernel mode./ }
  its('content') { should match /# TYPE promrun_root_advanced_cpu_kernel_mode_seconds gauge/ }
  its('content') { should match /promrun_root_advanced_cpu_kernel_mode_seconds\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0.00/ }
  its('content') { should match /# HELP promrun_root_advanced_elapsed_seconds Elapsed real time \(in seconds\)\./ }
  its('content') { should match /# TYPE promrun_root_advanced_elapsed_seconds gauge/ }
  its('content') { should match /promrun_root_advanced_elapsed_seconds\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0\.[0-9]+/ }
  its('content') { should match /# HELP promrun_root_advanced_cpu_user_mode_seconds Total number of CPU-seconds that the process spent in user mode./ }
  its('content') { should match /# TYPE promrun_root_advanced_cpu_user_mode_seconds gauge/ }
  its('content') { should match /promrun_root_advanced_cpu_user_mode_seconds\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0.00/ }
  its('content') { should match /# HELP promrun_root_advanced_max_resident_memory_kb Maximum resident set size of the process during its lifetime, in Kbytes./ }
  its('content') { should match /# TYPE promrun_root_advanced_max_resident_memory_kb gauge/ }
  its('content') { should match /promrun_root_advanced_max_resident_memory_kb\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} [0-9]+/ }
  its('content') { should match /# HELP promrun_root_advanced_avg_total_memory_kb Average total \(data\+stack\+text\) memory use of the process, in Kbytes./ }
  its('content') { should match /# TYPE promrun_root_advanced_avg_total_memory_kb gauge/ }
  its('content') { should match /promrun_root_advanced_avg_total_memory_kb\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('content') { should match /# HELP promrun_root_advanced_swapped_from_main_memory_count Number of times the process was swapped out of main memory./ }
  its('content') { should match /# TYPE promrun_root_advanced_swapped_from_main_memory_count gauge/ }
  its('content') { should match /promrun_root_advanced_swapped_from_main_memory_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('content') { should match /# HELP promrun_root_advanced_signals_delivered_to_process_count Number of signals delivered to the process./ }
  its('content') { should match /# TYPE promrun_root_advanced_signals_delivered_to_process_count gauge/ }
  its('content') { should match /promrun_root_advanced_signals_delivered_to_process_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('content') { should match /# HELP promrun_root_advanced_context_switch_count_involuntary_count Number of times the process was context-switched involuntarily \(because the time slice expired\)./ }
  its('content') { should match /# TYPE promrun_root_advanced_context_switch_count_involuntary_count gauge/ }
  its('content') { should match /promrun_root_advanced_context_switch_count_involuntary_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} [0-9]+/ }
  its('content') { should match /# HELP promrun_root_advanced_context_switch_count_voluntary_count Number of waits, times that the program was context-switched voluntarily, for instance while waiting for an I\/O operation to complete./ }
  its('content') { should match /# TYPE promrun_root_advanced_context_switch_count_voluntary_count gauge/ }
  its('content') { should match /promrun_root_advanced_context_switch_count_voluntary_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} [0-9]+/ }
  its('content') { should match /# HELP promrun_root_advanced_filesystem_inputs_count Number of filesystem inputs by the process./ }
  its('content') { should match /# TYPE promrun_root_advanced_filesystem_inputs_count gauge/ }
  its('content') { should match /promrun_root_advanced_filesystem_inputs_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} [0-9]+/ }
  its('content') { should match /# HELP promrun_root_advanced_filesystem_outputs_count Number of filesystem outputs by the process./ }
  its('content') { should match /# TYPE promrun_root_advanced_filesystem_outputs_count gauge/ }
  its('content') { should match /promrun_root_advanced_filesystem_outputs_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('content') { should match /# HELP promrun_root_advanced_socket_messages_received_count Number of socket messages received by the process./ }
  its('content') { should match /# TYPE promrun_root_advanced_socket_messages_received_count gauge/ }
  its('content') { should match /promrun_root_advanced_socket_messages_received_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('content') { should match /# HELP promrun_root_advanced_socket_messages_sent_count Number of socket messages sent by the process./ }
  its('content') { should match /# TYPE promrun_root_advanced_socket_messages_sent_count gauge/ }
  its('content') { should match /promrun_root_advanced_socket_messages_sent_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('content') { should match /# HELP promrun_root_advanced_exit_status Exit status of the command./ }
  its('content') { should match /# TYPE promrun_root_advanced_exit_status gauge/ }
  its('content') { should match /promrun_root_advanced_exit_status\{org="Test",env="test",user="root",description="RUN OF echo COMMAND",promrun_name="root_advanced",promrun="exit"\} 0/ }
  its('content') { should match /# HELP promrun_root_advanced_process_avg_size_resident_set_kb Average resident set size of the process, in Kbytes./ }
  its('content') { should match /# TYPE promrun_root_advanced_process_avg_size_resident_set_kb gauge/ }
  its('content') { should match /promrun_root_advanced_process_avg_size_resident_set_kb\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('content') { should match /# HELP promrun_root_advanced_process_avg_size_unshared_data_area_kb Average size of the process's unshared data area, in Kbytes./ }
  its('content') { should match /# TYPE promrun_root_advanced_process_avg_size_unshared_data_area_kb gauge/ }
  its('content') { should match /promrun_root_advanced_process_avg_size_unshared_data_area_kb\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('content') { should match /# HELP promrun_root_advanced_process_avg_size_unshared_stack_space_kb Average size of the process's unshared stack space, in Kbytes./ }
  its('content') { should match /# TYPE promrun_root_advanced_process_avg_size_unshared_stack_space_kb gauge/ }
  its('content') { should match /promrun_root_advanced_process_avg_size_unshared_stack_space_kb\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('content') { should match /# HELP promrun_root_advanced_process_avg_size_shared_text_space_kb Average size of the process's shared text space, in Kbytes./ }
  its('content') { should match /# TYPE promrun_root_advanced_process_avg_size_shared_text_space_kb gauge/ }
  its('content') { should match /promrun_root_advanced_process_avg_size_shared_text_space_kb\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('content') { should match /# HELP promrun_root_advanced_major_page_fault_count Number of major page faults that occurred while the process was running. These are faults where the page has to be read in from disk./ }
  its('content') { should match /# TYPE promrun_root_advanced_major_page_fault_count gauge/ }
  its('content') { should match /promrun_root_advanced_major_page_fault_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} [0-9]+/ }
  its('content') { should match /# HELP promrun_root_advanced_minor_page_fault_count Number of minor, or recoverable, page faults. These are faults for pages that are not valid but which have not yet been claimed by other virtual pages. Thus the data in the page is still valid but the system tables must be updated./ }
  its('content') { should match /# TYPE promrun_root_advanced_minor_page_fault_count gauge/ }
  its('content') { should match /promrun_root_advanced_minor_page_fault_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} [0-9]+/ }
  its('content') { should match /# HELP promrun_root_advanced_command Name and command-line arguments of the command being timed. See Label./ }
  its('content') { should match /# TYPE promrun_root_advanced_command gauge/ }
  its('content') { should match /promrun_root_advanced_command\{org="Test",env="test",user="root",description="RUN OF echo COMMAND",command="echo -n 123"\} 1/ }
  its('content') { should match /# HELP promrun_root_advanced_endtime End time in Unix time with microseconds./ }
  its('content') { should match /# TYPE promrun_root_advanced_endtime gauge/ }
  its('content') { should match /promrun_root_advanced_endtime\{org="Test",env="test",user="root",description="RUN OF echo COMMAND",promrun_name="root_advanced",promrun="endtime"\} [0-9]{10}\.[0-9]{3}$/ }
  its('size') { should > 5000 }
  it { should_not be_more_permissive_than('0664') }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
end
describe command('wc -l /opt/prometheus/etc/node_exporter_textfiles/promrun_root_advanced.1.prom') do
  its('exit_status') { should eq 0 }
  its('stderr') { should eq '' }
  its('stdout') { should match /^70 / }
end

# Run command again, this time in verbose mode
describe command('sudo promrun -v -l org=Test -d "RUN OF echo COMMAND" -l env=test -n root_advanced_verbose echo -n 321') do
  its('exit_status') { should eq 0 }
  its('stderr') { should eq '' }
  its('stdout') { should match /321/ }
  its('stdout') { should match /# HELP promrun_root_advanced_verbose_starttime Start time in Unix time with microseconds./ }
  its('stdout') { should match /# TYPE promrun_root_advanced_verbose_starttime gauge/ }
  its('stdout') { should match /promrun_root_advanced_verbose_starttime\{org="Test",env="test",user="root",description="RUN OF echo COMMAND",promrun_name="root_advanced_verbose",promrun="starttime"\} [0-9]{10}\.[0-9]{3}$/ }
  its('stdout') { should match /# HELP promrun_root_advanced_verbose_cpu_kernel_mode_seconds Total number of CPU-seconds that the process spent in kernel mode./ }
  its('stdout') { should match /# TYPE promrun_root_advanced_verbose_cpu_kernel_mode_seconds gauge/ }
  its('stdout') { should match /promrun_root_advanced_verbose_cpu_kernel_mode_seconds\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0.00/ }
  its('stdout') { should match /# HELP promrun_root_advanced_verbose_elapsed_seconds Elapsed real time \(in seconds\)\./ }
  its('stdout') { should match /# TYPE promrun_root_advanced_verbose_elapsed_seconds gauge/ }
  its('stdout') { should match /promrun_root_advanced_verbose_elapsed_seconds\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0\.[0-9]+/ }
  its('stdout') { should match /# HELP promrun_root_advanced_verbose_cpu_user_mode_seconds Total number of CPU-seconds that the process spent in user mode./ }
  its('stdout') { should match /# TYPE promrun_root_advanced_verbose_cpu_user_mode_seconds gauge/ }
  its('stdout') { should match /promrun_root_advanced_verbose_cpu_user_mode_seconds\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0.00/ }
  its('stdout') { should match /# HELP promrun_root_advanced_verbose_max_resident_memory_kb Maximum resident set size of the process during its lifetime, in Kbytes./ }
  its('stdout') { should match /# TYPE promrun_root_advanced_verbose_max_resident_memory_kb gauge/ }
  its('stdout') { should match /promrun_root_advanced_verbose_max_resident_memory_kb\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} [0-9]+/ }
  its('stdout') { should match /# HELP promrun_root_advanced_verbose_avg_total_memory_kb Average total \(data\+stack\+text\) memory use of the process, in Kbytes./ }
  its('stdout') { should match /# TYPE promrun_root_advanced_verbose_avg_total_memory_kb gauge/ }
  its('stdout') { should match /promrun_root_advanced_verbose_avg_total_memory_kb\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('stdout') { should match /# HELP promrun_root_advanced_verbose_swapped_from_main_memory_count Number of times the process was swapped out of main memory./ }
  its('stdout') { should match /# TYPE promrun_root_advanced_verbose_swapped_from_main_memory_count gauge/ }
  its('stdout') { should match /promrun_root_advanced_verbose_swapped_from_main_memory_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('stdout') { should match /# HELP promrun_root_advanced_verbose_signals_delivered_to_process_count Number of signals delivered to the process./ }
  its('stdout') { should match /# TYPE promrun_root_advanced_verbose_signals_delivered_to_process_count gauge/ }
  its('stdout') { should match /promrun_root_advanced_verbose_signals_delivered_to_process_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('stdout') { should match /# HELP promrun_root_advanced_verbose_context_switch_count_involuntary_count Number of times the process was context-switched involuntarily \(because the time slice expired\)./ }
  its('stdout') { should match /# TYPE promrun_root_advanced_verbose_context_switch_count_involuntary_count gauge/ }
  its('stdout') { should match /promrun_root_advanced_verbose_context_switch_count_involuntary_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} [0-9]+/ }
  its('stdout') { should match /# HELP promrun_root_advanced_verbose_context_switch_count_voluntary_count Number of waits, times that the program was context-switched voluntarily, for instance while waiting for an I\/O operation to complete./ }
  its('stdout') { should match /# TYPE promrun_root_advanced_verbose_context_switch_count_voluntary_count gauge/ }
  its('stdout') { should match /promrun_root_advanced_verbose_context_switch_count_voluntary_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} [0-9]+/ }
  its('stdout') { should match /# HELP promrun_root_advanced_verbose_filesystem_inputs_count Number of filesystem inputs by the process./ }
  its('stdout') { should match /# TYPE promrun_root_advanced_verbose_filesystem_inputs_count gauge/ }
  its('stdout') { should match /promrun_root_advanced_verbose_filesystem_inputs_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} [0-9]+/ }
  its('stdout') { should match /# HELP promrun_root_advanced_verbose_filesystem_outputs_count Number of filesystem outputs by the process./ }
  its('stdout') { should match /# TYPE promrun_root_advanced_verbose_filesystem_outputs_count gauge/ }
  its('stdout') { should match /promrun_root_advanced_verbose_filesystem_outputs_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('stdout') { should match /# HELP promrun_root_advanced_verbose_socket_messages_received_count Number of socket messages received by the process./ }
  its('stdout') { should match /# TYPE promrun_root_advanced_verbose_socket_messages_received_count gauge/ }
  its('stdout') { should match /promrun_root_advanced_verbose_socket_messages_received_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('stdout') { should match /# HELP promrun_root_advanced_verbose_socket_messages_sent_count Number of socket messages sent by the process./ }
  its('stdout') { should match /# TYPE promrun_root_advanced_verbose_socket_messages_sent_count gauge/ }
  its('stdout') { should match /promrun_root_advanced_verbose_socket_messages_sent_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('stdout') { should match /# HELP promrun_root_advanced_verbose_exit_status Exit status of the command./ }
  its('stdout') { should match /# TYPE promrun_root_advanced_verbose_exit_status gauge/ }
  its('stdout') { should match /promrun_root_advanced_verbose_exit_status\{org="Test",env="test",user="root",description="RUN OF echo COMMAND",promrun_name="root_advanced_verbose",promrun="exit"\} 0/ }
  its('stdout') { should match /# HELP promrun_root_advanced_verbose_process_avg_size_resident_set_kb Average resident set size of the process, in Kbytes./ }
  its('stdout') { should match /# TYPE promrun_root_advanced_verbose_process_avg_size_resident_set_kb gauge/ }
  its('stdout') { should match /promrun_root_advanced_verbose_process_avg_size_resident_set_kb\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('stdout') { should match /# HELP promrun_root_advanced_verbose_process_avg_size_unshared_data_area_kb Average size of the process's unshared data area, in Kbytes./ }
  its('stdout') { should match /# TYPE promrun_root_advanced_verbose_process_avg_size_unshared_data_area_kb gauge/ }
  its('stdout') { should match /promrun_root_advanced_verbose_process_avg_size_unshared_data_area_kb\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('stdout') { should match /# HELP promrun_root_advanced_verbose_process_avg_size_unshared_stack_space_kb Average size of the process's unshared stack space, in Kbytes./ }
  its('stdout') { should match /# TYPE promrun_root_advanced_verbose_process_avg_size_unshared_stack_space_kb gauge/ }
  its('stdout') { should match /promrun_root_advanced_verbose_process_avg_size_unshared_stack_space_kb\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('stdout') { should match /# HELP promrun_root_advanced_verbose_process_avg_size_shared_text_space_kb Average size of the process's shared text space, in Kbytes./ }
  its('stdout') { should match /# TYPE promrun_root_advanced_verbose_process_avg_size_shared_text_space_kb gauge/ }
  its('stdout') { should match /promrun_root_advanced_verbose_process_avg_size_shared_text_space_kb\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('stdout') { should match /# HELP promrun_root_advanced_verbose_major_page_fault_count Number of major page faults that occurred while the process was running. These are faults where the page has to be read in from disk./ }
  its('stdout') { should match /# TYPE promrun_root_advanced_verbose_major_page_fault_count gauge/ }
  its('stdout') { should match /promrun_root_advanced_verbose_major_page_fault_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} [0-9]+/ }
  its('stdout') { should match /# HELP promrun_root_advanced_verbose_minor_page_fault_count Number of minor, or recoverable, page faults. These are faults for pages that are not valid but which have not yet been claimed by other virtual pages. Thus the data in the page is still valid but the system tables must be updated./ }
  its('stdout') { should match /# TYPE promrun_root_advanced_verbose_minor_page_fault_count gauge/ }
  its('stdout') { should match /promrun_root_advanced_verbose_minor_page_fault_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} [0-9]+/ }
  its('stdout') { should match /# HELP promrun_root_advanced_verbose_command Name and command-line arguments of the command being timed. See Label./ }
  its('stdout') { should match /# TYPE promrun_root_advanced_verbose_command gauge/ }
  its('stdout') { should match /promrun_root_advanced_verbose_command\{org="Test",env="test",user="root",description="RUN OF echo COMMAND",command="echo -n 321"\} 1/ }
  its('stdout') { should match /# HELP promrun_root_advanced_verbose_endtime End time in Unix time with microseconds./ }
  its('stdout') { should match /# TYPE promrun_root_advanced_verbose_endtime gauge/ }
  its('stdout') { should match /promrun_root_advanced_verbose_endtime\{org="Test",env="test",user="root",description="RUN OF echo COMMAND",promrun_name="root_advanced_verbose",promrun="endtime"\} [0-9]{10}\.[0-9]{3}$/ }
end

# Resulting prom file is as expected
describe file('/opt/prometheus/etc/node_exporter_textfiles/promrun_root_advanced_verbose.prom') do
  it { should be_file }
  its('content') { should match /# HELP promrun_root_advanced_verbose_starttime Start time in Unix time with microseconds./ }
  its('content') { should match /# TYPE promrun_root_advanced_verbose_starttime gauge/ }
  its('content') { should match /promrun_root_advanced_verbose_starttime\{org="Test",env="test",user="root",description="RUN OF echo COMMAND",promrun_name="root_advanced_verbose",promrun="starttime"\} [0-9]{10}\.[0-9]{3}$/ }
  its('content') { should match /# HELP promrun_root_advanced_verbose_cpu_kernel_mode_seconds Total number of CPU-seconds that the process spent in kernel mode./ }
  its('content') { should match /# TYPE promrun_root_advanced_verbose_cpu_kernel_mode_seconds gauge/ }
  its('content') { should match /promrun_root_advanced_verbose_cpu_kernel_mode_seconds\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0.00/ }
  its('content') { should match /# HELP promrun_root_advanced_verbose_elapsed_seconds Elapsed real time \(in seconds\)\./ }
  its('content') { should match /# TYPE promrun_root_advanced_verbose_elapsed_seconds gauge/ }
  its('content') { should match /promrun_root_advanced_verbose_elapsed_seconds\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0\.[0-9]+/ }
  its('content') { should match /# HELP promrun_root_advanced_verbose_cpu_user_mode_seconds Total number of CPU-seconds that the process spent in user mode./ }
  its('content') { should match /# TYPE promrun_root_advanced_verbose_cpu_user_mode_seconds gauge/ }
  its('content') { should match /promrun_root_advanced_verbose_cpu_user_mode_seconds\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0.00/ }
  its('content') { should match /# HELP promrun_root_advanced_verbose_max_resident_memory_kb Maximum resident set size of the process during its lifetime, in Kbytes./ }
  its('content') { should match /# TYPE promrun_root_advanced_verbose_max_resident_memory_kb gauge/ }
  its('content') { should match /promrun_root_advanced_verbose_max_resident_memory_kb\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} [0-9]+/ }
  its('content') { should match /# HELP promrun_root_advanced_verbose_avg_total_memory_kb Average total \(data\+stack\+text\) memory use of the process, in Kbytes./ }
  its('content') { should match /# TYPE promrun_root_advanced_verbose_avg_total_memory_kb gauge/ }
  its('content') { should match /promrun_root_advanced_verbose_avg_total_memory_kb\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('content') { should match /# HELP promrun_root_advanced_verbose_swapped_from_main_memory_count Number of times the process was swapped out of main memory./ }
  its('content') { should match /# TYPE promrun_root_advanced_verbose_swapped_from_main_memory_count gauge/ }
  its('content') { should match /promrun_root_advanced_verbose_swapped_from_main_memory_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('content') { should match /# HELP promrun_root_advanced_verbose_signals_delivered_to_process_count Number of signals delivered to the process./ }
  its('content') { should match /# TYPE promrun_root_advanced_verbose_signals_delivered_to_process_count gauge/ }
  its('content') { should match /promrun_root_advanced_verbose_signals_delivered_to_process_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('content') { should match /# HELP promrun_root_advanced_verbose_context_switch_count_involuntary_count Number of times the process was context-switched involuntarily \(because the time slice expired\)./ }
  its('content') { should match /# TYPE promrun_root_advanced_verbose_context_switch_count_involuntary_count gauge/ }
  its('content') { should match /promrun_root_advanced_verbose_context_switch_count_involuntary_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} [0-9]+/ }
  its('content') { should match /# HELP promrun_root_advanced_verbose_context_switch_count_voluntary_count Number of waits, times that the program was context-switched voluntarily, for instance while waiting for an I\/O operation to complete./ }
  its('content') { should match /# TYPE promrun_root_advanced_verbose_context_switch_count_voluntary_count gauge/ }
  its('content') { should match /promrun_root_advanced_verbose_context_switch_count_voluntary_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} [0-9]+/ }
  its('content') { should match /# HELP promrun_root_advanced_verbose_filesystem_inputs_count Number of filesystem inputs by the process./ }
  its('content') { should match /# TYPE promrun_root_advanced_verbose_filesystem_inputs_count gauge/ }
  its('content') { should match /promrun_root_advanced_verbose_filesystem_inputs_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} [0-9]+/ }
  its('content') { should match /# HELP promrun_root_advanced_verbose_filesystem_outputs_count Number of filesystem outputs by the process./ }
  its('content') { should match /# TYPE promrun_root_advanced_verbose_filesystem_outputs_count gauge/ }
  its('content') { should match /promrun_root_advanced_verbose_filesystem_outputs_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('content') { should match /# HELP promrun_root_advanced_verbose_socket_messages_received_count Number of socket messages received by the process./ }
  its('content') { should match /# TYPE promrun_root_advanced_verbose_socket_messages_received_count gauge/ }
  its('content') { should match /promrun_root_advanced_verbose_socket_messages_received_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('content') { should match /# HELP promrun_root_advanced_verbose_socket_messages_sent_count Number of socket messages sent by the process./ }
  its('content') { should match /# TYPE promrun_root_advanced_verbose_socket_messages_sent_count gauge/ }
  its('content') { should match /promrun_root_advanced_verbose_socket_messages_sent_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('content') { should match /# HELP promrun_root_advanced_verbose_exit_status Exit status of the command./ }
  its('content') { should match /# TYPE promrun_root_advanced_verbose_exit_status gauge/ }
  its('content') { should match /promrun_root_advanced_verbose_exit_status\{org="Test",env="test",user="root",description="RUN OF echo COMMAND",promrun_name="root_advanced_verbose",promrun="exit"\} 0/ }
  its('content') { should match /# HELP promrun_root_advanced_verbose_process_avg_size_resident_set_kb Average resident set size of the process, in Kbytes./ }
  its('content') { should match /# TYPE promrun_root_advanced_verbose_process_avg_size_resident_set_kb gauge/ }
  its('content') { should match /promrun_root_advanced_verbose_process_avg_size_resident_set_kb\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('content') { should match /# HELP promrun_root_advanced_verbose_process_avg_size_unshared_data_area_kb Average size of the process's unshared data area, in Kbytes./ }
  its('content') { should match /# TYPE promrun_root_advanced_verbose_process_avg_size_unshared_data_area_kb gauge/ }
  its('content') { should match /promrun_root_advanced_verbose_process_avg_size_unshared_data_area_kb\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('content') { should match /# HELP promrun_root_advanced_verbose_process_avg_size_unshared_stack_space_kb Average size of the process's unshared stack space, in Kbytes./ }
  its('content') { should match /# TYPE promrun_root_advanced_verbose_process_avg_size_unshared_stack_space_kb gauge/ }
  its('content') { should match /promrun_root_advanced_verbose_process_avg_size_unshared_stack_space_kb\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('content') { should match /# HELP promrun_root_advanced_verbose_process_avg_size_shared_text_space_kb Average size of the process's shared text space, in Kbytes./ }
  its('content') { should match /# TYPE promrun_root_advanced_verbose_process_avg_size_shared_text_space_kb gauge/ }
  its('content') { should match /promrun_root_advanced_verbose_process_avg_size_shared_text_space_kb\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} 0/ }
  its('content') { should match /# HELP promrun_root_advanced_verbose_major_page_fault_count Number of major page faults that occurred while the process was running. These are faults where the page has to be read in from disk./ }
  its('content') { should match /# TYPE promrun_root_advanced_verbose_major_page_fault_count gauge/ }
  its('content') { should match /promrun_root_advanced_verbose_major_page_fault_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} [0-9]+/ }
  its('content') { should match /# HELP promrun_root_advanced_verbose_minor_page_fault_count Number of minor, or recoverable, page faults. These are faults for pages that are not valid but which have not yet been claimed by other virtual pages. Thus the data in the page is still valid but the system tables must be updated./ }
  its('content') { should match /# TYPE promrun_root_advanced_verbose_minor_page_fault_count gauge/ }
  its('content') { should match /promrun_root_advanced_verbose_minor_page_fault_count\{org="Test",env="test",user="root",description="RUN OF echo COMMAND"\} [0-9]+/ }
  its('content') { should match /# HELP promrun_root_advanced_verbose_command Name and command-line arguments of the command being timed. See Label./ }
  its('content') { should match /# TYPE promrun_root_advanced_verbose_command gauge/ }
  its('content') { should match /promrun_root_advanced_verbose_command\{org="Test",env="test",user="root",description="RUN OF echo COMMAND",command="echo -n 321"\} 1/ }
  its('content') { should match /# HELP promrun_root_advanced_verbose_endtime End time in Unix time with microseconds./ }
  its('content') { should match /# TYPE promrun_root_advanced_verbose_endtime gauge/ }
  its('content') { should match /promrun_root_advanced_verbose_endtime\{org="Test",env="test",user="root",description="RUN OF echo COMMAND",promrun_name="root_advanced_verbose",promrun="endtime"\} [0-9]{10}\.[0-9]{3}$/ }
  its('size') { should > 5000 }
  it { should_not be_more_permissive_than('0664') }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
end
describe command('wc -l /opt/prometheus/etc/node_exporter_textfiles/promrun_root_advanced_verbose.prom') do
  its('exit_status') { should eq 0 }
  its('stderr') { should eq '' }
  its('stdout') { should match /^70 / }
end

# Remove prom file
describe command('sudo rm -f /opt/prometheus/etc/node_exporter_textfiles/promrun_root_advanced.1.prom*') do
  its('exit_status') { should eq 0 }
end
describe command('sudo rm -f /opt/prometheus/etc/node_exporter_textfiles/promrun_root_advanced.prom*') do
  its('exit_status') { should eq 0 }
end
describe command('sudo rm -f /opt/prometheus/etc/node_exporter_textfiles/promrun_root_advanced_verbose.prom*') do
  its('exit_status') { should eq 0 }
end
