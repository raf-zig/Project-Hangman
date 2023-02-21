require_relative 'hangman.rb'

lines = File.readlines('google-10000-english-no-swears.txt')
words = []
lines.each { |line| words << line if line.length > 5 and line.length < 12}
word = words.sample.chomp

secret_word = word.split('')
puts secret_word.join
guessed_word = secret_word.map { |l|  '_ '}
puts guessed_word.join
puts
bad_letters = []

def user_choice
  letter = ''
  while letter == ''
    letter = gets.downcase.chomp
  end 
  return letter
end

def check_result(secret_word, bad_letters, guessed_word, user_choice)
  secret_word.each_with_index do |letter, index|
    if letter == user_choice
      guessed_word[index] = user_choice
    end
  end
  unless secret_word.include?(user_choice)
    bad_letters << user_choice unless bad_letters.include?(user_choice)
  end
end

i = 0
while i < 4 do
  i += 1
  puts 'Would you like to save the game? y/n'
  save_game = gets.downcase.chomp
  if save_game == 'y'
    save_game(secret_word, guessed_word, i, bad_letters)
    break
  end
  puts 'Enter word:'
  check_result(secret_word, bad_letters, guessed_word, user_choice)
  puts guessed_word.join
  puts "Errors - #{bad_letters.join}"
  puts "There are still attempts left - #{4-i}"
end