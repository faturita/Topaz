require 'socket'

class String
    def numeric?
        return true if self =~ /^\d+$/
        true if Float(self) rescue false
    end
end

s = TCPSocket.new ARGV[0], 13855
s.puts '.'

file = open('blinking.dat', 'w');

while line = s.gets
    list = line.split("\n")
    list.each do |element|
        puts element
        file.puts element
    end
end
s.close
file.close
