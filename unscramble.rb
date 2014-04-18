#!/usr/bin/env ruby

$wordlist = Array.new
File.readlines('sowpods.txt').each do |word|
   $wordlist << word.chomp 
end
p $wordlist[1].class 

if  $wordlist.include? "AXE"
    print $wordlist.index "AXE"
end
