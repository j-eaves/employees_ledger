require 'getoptlong'
 
data_file = 'names.txt'
words_to_generate = 100
 
min_length = 3
max_length = 9
 
opts = GetoptLong.new(
  ["--datafile", "-d", GetoptLong::OPTIONAL_ARGUMENT],
  ["--number-of-words", "-n", GetoptLong::OPTIONAL_ARGUMENT]
)
 
opts.each do |opt, arg|
  case opt
  when '--datafile'
    data_file = arg
  when '--number-of-words'
    words_to_generate = arg
  end
end
 
start_pairs = []
follower_letters = Hash.new('')
 
File.open(data_file, 'r') do |file|
  chars = file.read.chomp.downcase.gsub(/\s/, ' ').chars.to_a
  chars.push(chars[0], chars[1])
  (chars.length-2).times do |i|
    if chars[i] =~ /\s/
      start_pairs.push(chars[i+1, 2].join)
    end
    follower_letters[chars[i, 2].join]=follower_letters[chars[i,2].join]+chars[i+2,1].join
  end
end
 
def generate_word(word, follower_letters, min_length)
  last_pair = word[-2, 2]
  letter = follower_letters[last_pair].slice(rand(follower_letters[last_pair].length), 1)
  if word =~ /\s$/
    return word unless word.length <= min_length
    return generate_word(word[-1, 1]+letter, follower_letters, min_length)
  else
    word = word.gsub(/^\s/, '')
    return generate_word(word+letter, follower_letters, min_length)
  end
end
 first_name = ""
 last_name = ""
words_to_generate.times do |i|
  first_name = generate_word(start_pairs[rand start_pairs.length], follower_letters, min_length)[0, max_length].capitalize
  last_name = generate_word(start_pairs[rand start_pairs.length], follower_letters, min_length)[0, max_length].capitalize  
  p first_name+" "+last_name
end

