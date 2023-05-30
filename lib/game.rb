# frozen_string_literal: true

require_relative 'saved_game'
require_relative 'print_image'

lines = File.readlines('google-10000-english-no-swears.txt')
words = []
lines.each { |line| words << line if (line.length > 5) && (line.length < 12) }
word = words.sample.chomp
secret_word = word.split('')
guessed_word = secret_word.map { '_ ' }
bad_letters = []

def user_choice
  letter = ''
  letter = gets.downcase.chomp while letter == ''
  letter
end

def check_result(secret_word, bad_letters, guessed_word, user_choice)
  secret_word.each_with_index do |letter, index|
    guessed_word[index] = user_choice if letter == user_choice
  end
  return if secret_word.include?(user_choice)

  bad_letters << user_choice unless bad_letters.include?(user_choice)
end

puts 'Do you want to open a saved game? y/n'
open_game = gets.downcase.chomp
if open_game == 'y'
  saved_game_data = continue_game
  secret_word = saved_game_data[0]
  guessed_word = saved_game_data[1]
  bad_letters = saved_game_data[2]
end

puts 'Guess the hidden word',
     'The game continues up to 7 errors'

while bad_letters.size < 7
  puts 'Would you like to save the game? y/n'
  user_wants_to_save_game = gets.downcase.chomp
  if user_wants_to_save_game == 'y'
    save_game(secret_word, guessed_word, bad_letters)
    break
  end

  puts guessed_word.join
  print 'Enter letter: '
  check_result(secret_word, bad_letters, guessed_word, user_choice)
  puts
  if guessed_word.all? { |l| l != '_ ' }
    puts 'You guessed the word'
    break
  end
  puts "Errors - #{bad_letters.join('  ')}"
  print_man(bad_letters.size)
  puts
  puts guessed_word.join,
       "Number of errors - #{bad_letters.size}"
  puts "The hidden word - #{secret_word.join}" if bad_letters.size == 7
end
