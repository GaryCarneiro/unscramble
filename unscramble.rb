#!/usr/bin/env ruby

#Input word is first word
if not ARGV[0].nil?
  iword = ARGV[0].split(//)
else
  puts "Pass some scramble word string"
  exit(1)
end
words = []

#Line seperator for Mac = "\r\n" ; Windows = "\n"
list = File.read("sowpods.txt").split("\n")
#p list.size 
 
for i in (1..iword.length)
    (iword.permutation(i).map &:join).each do |word|
      #p word
        if list.include? word.upcase
            p word
            words << word.upcase!
        end
    end
end

puts "Possible words are zero" if words.size == 0 

words.sort!
words.uniq!

#p words

#words.each { | x| puts x }

words.each { | x|  x.upcase! }

############
dictLetterScore = {1 => %q[A E I O U L N S T R],
  2 => %q[D G],
  3 => %q[B C M P],
  4 => %q[F H V W Y],
  5 => %q[K],
  8 => %q[J X],
  10 => %q[Q Z]
}


dictScore = {}

words.each do | word |
  #puts "--------"
  
  if dictScore.keys.include? word
    puts "word exists #{word}"
  else
    dictScore[word] = 0
  end

#Score calculation
  0.upto(word.length - 1) do | i |
    dictLetterScore.keys.each do | key | 
      if dictLetterScore[key].include? word[i]
        #puts word[i], key
        dictScore[word] += key
      end
   end
 end
end

#puts dictScore

#p dictScore.values.sort.reverse

#Score representation
dictScore.values.sort.reverse.each do | score | 
  #print score
  dictScore.keys.each do | word |
    if dictScore[word] == score
      print word, ":", score, "\n"
    end
  end
end
