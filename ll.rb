#!/usr/bin/env ruby

require_relative 'lib/linked_list'

payloads = ARGV # ARGV holds the command line arguments that were passed in

# Now, build a LinkedList
ll = LinkedList.new

# And, populate it
#
# <YOUR CODE GOES HERE>
pay_length = payloads.length
if pay_length > 0
  counter = 0
  while counter <= pay_length
    ll.push("\"#{payloads[counter]}\"")
    counter += 1
  end
end

# Then, print it out
#
# <YOUR CODE GOES HERE>
ll.print_out