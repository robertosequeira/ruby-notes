require_relative('helpers')

header('Execute system commands')

headline('System')

# http://ruby-doc.org/core-2.3.0/Kernel.html#method-i-system
# Waits for the command to end and returns true if the command gives zero exit status, false for non zero exit status
# and nil if command execution fails

# $? is set to the process status after the command execution

puts system('date')
puts $?               # pid 29357 exit 0

headline('Backticks')
# http://ruby-doc.org/core-2.3.0/Kernel.html#method-i-60
# Returns the standard output of running a command in a subshell
puts `date`
puts $?

separator

puts %x(ls)
puts $?

