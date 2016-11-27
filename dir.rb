require_relative  'helpers'

header('Dir')
my_dir = 'files'

headline('Methods')
# print working directory
puts Dir.pwd                        # .../ruby-notes
puts Dir.getwd                      # .../ruby-notes

separator

# change working directory
Dir.chdir('files')
puts Dir.pwd                        # .../ruby-notes/files
Dir.chdir('..')
puts Dir.pwd                        # .../ruby-notes

separator

# Original working directory is restored when block ends
Dir.chdir('..') do
  puts Dir.pwd                      # ...
end
puts Dir.pwd                        # .../ruby-notes

separator

my_dir = 'files'

p Dir.entries(my_dir)             # ["file.txt", "zero_file.txt", "file_2.txt", "file.txt.sym", "file_creation.txt", "..", "."]

separator


separator

# iterates over directory entries
Dir.foreach(my_dir) { |entry| puts entry} # file.txt - zero_file.txt - file_2.txt ...

separator

Dir.new(my_dir).each { |entry| puts entry} # file.txt - zero_file.txt - file_2.txt ...

separator

p Dir.exist?(my_dir)              # true

puts Dir.home                     # /home/roberto

separator

Dir.mkdir('my_dir')
# Throws an exception if the directory is non empty
Dir.delete('my_dir')

separator

p dir = Dir.new(my_dir)
puts dir.read                   # file.txt
puts dir.read                   # zero_file.txt
puts dir.read                   # file_2.txt
dir.rewind
puts dir.read                   # file.txt

separator
dir = Dir.new(my_dir)
# current position in dir
puts dir.tell                   # 0
puts dir.read                   # file.txt
puts position = dir.tell        # 920649409492205114
puts dir.read                   # zero_file.txt
# Seeks to a particular position in the dir
dir.seek(position)
puts dir.read                   # zero_file.txt

