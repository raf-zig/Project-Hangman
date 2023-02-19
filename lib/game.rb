lines = File.readlines('google-10000-english-no-swears.txt')
words = []
lines.each { |line| words << line if line.length > 5 and line.length < 12}
word = words.sample.chomp

secret_word = word.split('')
print secret_word
guessed_word = secret_word.map { |l|  '_ '}.join
print guessed_word

score = 0
bad_letters = []
good_letters = []

def user_choice (secret_word, score, bad_letters, good_letters)
  user_letter = gets.downcase.chomp
  if secret_word.include?(user_letter)
    good_letters << user_letter
    score += 1
    puts good_letters
    puts score
  else
    bad_letters << user_letter
    score +=1
    puts bad_letters
    puts score
  end
end
user_choice(secret_word, score, bad_letters, good_letters)
puts good_letters
puts score