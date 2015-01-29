#!/usr/bin/env ruby

iword = ARGV[0].split(//)
 
words = []
list = File.read("sowpods.txt").split("\n")
 
for i in (1..iword.length)
    (iword.permutation(i).map &:join).each do |word|
        if list.include? word.upcase
            words << word
        end
    end
end
 
p words.sort.uniq
