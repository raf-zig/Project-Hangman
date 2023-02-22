require_relative 'hangman'
require_relative 'print_image'

lines = File.readlines('google-10000-english-no-swears.txt')
words = []
lines.each { |line| words << line if line.length > 5 and line.length < 12}
word = words.sample.chomp
secret_word = word.split('')
guessed_word = secret_word.map { |l|  '_ '}
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
puts 'Do you want to open a saved game? y/n'
open_game = gets.downcase.chomp
if open_game == 'y'
  saved_game_data = continue_game
  secret_word = saved_game_data[0]
  guessed_word = saved_game_data[1]
  i = saved_game_data[2] 
  bad_letters = saved_game_data[3]
end
puts 'You have 7 attempts to guess the word. The game continues up to 7 errors',
while i < 7 do
  
  puts 'Would you like to save the game? y/n'
  save_game = gets.downcase.chomp
  if save_game == 'y'
    save_game(secret_word, guessed_word, i, bad_letters)
    break
  end
  i += 1
  
        secret_word.join,
        'Guess the hidden word',
        guessed_word.join
  print 'Enter word: '
  check_result(secret_word, bad_letters, guessed_word, user_choice)
  puts "Errors - #{bad_letters.join('  ')}"
  print_man(bad_letters.size) 
  puts  guessed_word.join,
       "There are still attempts left - #{7-i}"
end