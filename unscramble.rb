#!/usr/bin/env ruby

#Input word is first word
if not ARGV[0].nil?
  iword = ARGV[0].split(//)
else
  puts "Pass some scramble word string"
  exit(1)
end

 
words = []
#Line seperator for Mac "\r\n"
list = File.read("sowpods.txt").split("\r\n")
#p list.size 
 
for i in (1..iword.length)
    (iword.permutation(i).map &:join).each do |word|
      #p word
        if list.include? word.upcase
            #p word
            words << word
        end
    end
end

puts "Possible words are zero" if words.size == 0 

words.sort.uniq!
words.each { | x| puts x }
