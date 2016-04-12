require_relative 'helpers'
# http://ruby-doc.org/core-2.3.0/doc/regexp_rdoc.html

header('Regular expression')

headline('Define a regular expression')

/\d+/
%r(\d+)

foo = 'hello'
/#{foo}/
%r(#{foo})

headline('Test a match')

puts /\d+/ =~ 'Level 33 complete'         # 6 - 0 based index of the first match

puts $&                                   # 33 - string matched by the last successful pattern match
puts $`                                   #'Level ' - String to the left of the last successful pattern match
puts $'                                   #' complete' - String to the right of the last successful pattern match

separator

# groups
puts /(\w+) (potato|user)/ =~ 'Welcome user'      # 0 - 0 based index of the first match
puts $+                                           # user - The last bracket matched by the last successful match.
# the nth group matched by the last successful match. May be > 1
puts $1                                     # Welcome
puts $2                                     # user

puts $~       # Welcome user - information the last match in current scope

separator

# case insensite flag
puts /sequeira/i =~ 'Roberto Sequeira'    # 8 - index of the first match

separator

# test expression do not match
puts /\d+/ !~ 'Level 33 complete'       # false
puts /\d+/ !~ 'Level complete'          # true


headline('MatchData')

m = /(\d+):(\d+)/.match('Time is 6:58pm')
p m                         # <MatchData "6:58" 1:"6" 2:"58">
puts m.pre_match            # 'Time is ' - equivalent to $`
puts m.post_match           # pm - equivalent to $'
puts m[0]                   # 6:58 - equivalent to $& - returns the all match
puts m[1]                   # 6 - equivalent to $1 - [1,2..]returns the sub-matches
puts m[2]                   # 58 - equivalent to $2

headline('Scan')

# scan return a array with matched elements
p 'Time is 7:07pm'.scan(/\d+/)    # ["7", "07"]

# \1 \2 and refer to capture groups from the regular expression
puts 'Roberto Sequeira'.gsub(/(\w+) (\w+)/, '\2, \1')     # Sequeira, Roberto
