lines = File.readlines('google-10000-english-no-swears.txt')
words = []
lines.each { |line| words << line if line.length > 5 and line.length < 12}
word = words.sample.chomp

secret_word = word.split('')
print secret_word
#guessed_word = secret_word.map { |l|  '_ '}.join
guessed_word = secret_word.map { |l|  '_ '}
print guessed_word.join


bad_letters = []


def user_choice (secret_word, bad_letters, guessed_word)
  user_letter = gets.downcase.chomp
  secret_word.each_with_index do |letter, index|
    if letter == user_letter
      guessed_word[index] = user_letter
    else
    bad_letters << user_letter
    end
  end
end

user_choice(secret_word, bad_letters, guessed_word)

puts guessed_word.join
