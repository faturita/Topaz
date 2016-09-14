require 'socket'

class String
    def numeric?
        return true if self =~ /^\d+$/
        true if Float(self) rescue false
    end
end

s = TCPSocket.new ARGV[0], 13855

file = open('blinking.mat', 'w');

while line = s.gets
    list = line.split(',')
    list.each do |element|
        if (element.numeric?)
            puts element
            file.puts element
        end
    end
end
s.close
file.close
