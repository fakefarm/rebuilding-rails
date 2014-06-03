require 'bobo'

class Object
  def self.const_missing(c)
    STDERR.puts "Missing constant: #{c.inspect}!"
  end
end

Bobo.new.print_bobo

# Everything is an object. What that means is there are no special situations to creating new functionality. Just learning how the current system works, and how to override it. Duck typing is taking an existing method and adding new work to it.
