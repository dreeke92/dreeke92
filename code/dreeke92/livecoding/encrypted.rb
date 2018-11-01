def encrypt(sentence)

alphabet = ('A'..'z').to_a
array_sentence = sentence.split("")
word_array = []

  array_sentence.each do |element|
  if element ==" "
    new_character = element
  else
  index_of = alphabet.index(element).to_i
  new_index = index_of - 3
  new_character = alphabet[new_index]

  end
  word_array << new_character
  end

  final_word = word_array.join("")
end

p encrypt("Ola como te llamas?")

def deencrypt(sentence)

alphabet = ('A'..'z').to_a
array_sentence = sentence.split("")
word_array = []

  array_sentence.each do |element|
  if element ==" "
    new_character = element
  else
  index_of = alphabet.index(element).to_i
  new_index = index_of + 3
  new_character = alphabet[new_index]

  end
  word_array << new_character
  end

  final_word = word_array.join("")
end

p deencrypt("Li^ `ljl qb ii^j^px")



# encrypt("THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG")
# => "QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD"

#1- create 1 array with the alphabet
#2-


# def encrypt(sentence)

# alphabet = ('A'..'z').to_a
# array_sentence = sentence.split("")
# word_array = []

#   array_sentence.each do |element|
#   index_of = alphabet.index(element).to_i

#   new_index = index_of - 3
#   new_character = alphabet[new_index]
#   word_array << new_character
#   end

#   final_word = word_array.join("")
# end

# p encrypt("Ola como te llamas?")
