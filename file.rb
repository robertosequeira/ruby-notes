require_relative 'helpers'

header('File')

my_file = 'files/file.txt'
my_directory = 'files'
headline('Methods')

puts File.absolute_path('file.txt', 'files')            # .../ruby-notes/files/file.txt

separator

# last access time
puts File.atime(my_file)                                # 2016-04-24 14:48:52 -0600
# puts File.birthtime(my_file)
# Change time (the time at which directory information about the file was changed, not the file itself).
puts File.ctime(my_file)                                # 2016-04-24 15:05:50 -0600
# Modification time for file
puts File.mtime(my_file)                                # 2016-04-24 15:12:28 -0600

separator

puts File.basename('/files/file.txt')                   # file.txt
puts File.basename('/bar/files/file.txt', '.txt')       # file
puts File.basename('/foo/bar/files/file.txt', '.*')     # file

separator

puts File.extname(my_file)                              # .txt

separator

puts File.dirname('/foo/bar/files/file.txt')            # /foo/bar/files

separator

#File.delete(my_file)

separator

puts File.file?(my_file)                                # true
puts File.file?(my_directory)                           # false
puts File.directory?(my_file)                           # false
puts File.directory?(my_directory)                      # true

separator

puts File.exist?(my_file)                               # true
puts File.exist?(my_directory)                          # true

separator

puts File.ftype(my_file)                                # file
puts File.ftype(my_directory)                           # directory

separator

puts File.join('foo', 'bar', 'files', 'file.txt')       # foo/bar/files/file.txt

separator

# File.link(my_file, my_file + '.txt')

separator

# w to create the file if it does not exists
# r, r+, w, w+, a, a+
file = File.new(File.join(my_directory,'file_creation.txt'), 'w')
file.puts('hello')
file.close

separator

puts File.owned?(my_file)                               # true
puts File.readable?(my_file)                            # true

separator

File.symlink(File.absolute_path(my_file) , my_file + '.sym') unless File.exist?(my_file + '.sym')
# name of the file refereced by given link
puts File.readlink(my_file + '.sym')                    # .../ruby-notes/files/file.txt
puts File.symlink?(my_file)                             # false
puts File.symlink?(my_file + '.sym')                    # true

separator

puts File.size(my_file)                                 # 452

separator

p File.split(my_file)                                   # ["files", "file.txt"]
p File.split('/foo/bar/files/file.txt')                 # ["/foo/bar/files", "file.txt"]

separator

stat = File.stat(my_file)
# <File::Stat dev=0x801, ino=14420746, mode=0100644, nlink=1, uid=1000, gid=1000, rdev=0x0, size=452,
# blksize=4096, blocks=8, atime=2016-04-24 16:18:09 -0600, mtime=2016-04-24 15:12:28 -0600, ctime=2016-04-24 15:57:26 -0600>
p stat
puts stat.atime
puts stat.ctime
puts stat.mtime

separator

puts File.world_readable?(my_file)                      # 420

separator

puts File.zero?(my_file)                                # true
puts File.zero?('files/zero_file.txt')                  # false

headline('Read')

# Reads all file content
file = File.open(my_file)
puts file.read
# file must be closed
file.close

separator

puts File.read(my_file)

separator

# when a block is used the file is automatically closed
File.read(my_file).lines.each { |line| puts line}

headline('Readlines')

# Returns an array containing each line of the file
file = File.open(my_file)
lines = file.readlines
puts lines[0]
file.close

separator

lines = File.readlines(my_file)
puts lines[1]

headline('Each')

File.open(my_file) do |file|
  file.each {|line| puts line}
  file.rewind
  puts '--------------------------------'
  file.each_line {|line| puts line}
end

separator

File.foreach(my_file) do |line|
  puts line
end

headline('IO#gets vs Kernel#readline')

# Starts printing nil once the last line has been reached
File.open(my_file) do |file|
  15.times { p file.gets }
end

separator

file = File.open(my_file)
puts file.gets                                    # Lorem ipsum dolor sit amet, eleifend incorrupte reprimique cum te, has id accusamus inciderint.
puts file.gets                                    # Ei vocibus disputationi pro, elit ipsum ex pri.

# Current input line of the last file that was read
puts $.                                           # 2

separator

# Throws and exception after the last line has been reached
begin
  File.open(my_file) do |file|
    15.times { p file.readline }
  end
rescue
  p $!                                            # <EOFError: end of file reached>
end



