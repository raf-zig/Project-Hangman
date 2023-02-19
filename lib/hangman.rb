require 'yaml'
require_relative 'game.rb'
require_relative 'print.rb'

def save_game(secret_word, guessed_word, score, bad_letters, good_letters)
  puts 'Do you want to save the game? (y/n)'
  data = [secret_word, guessed_word, score, bad_letters]
  File.open('test1.yaml', 'w') do |file|
    file.puts YAML.dump data
  end
end
save_game(['k', 'f'], ['g', 'r'], 5, ['w', 'v'], ['s', 'q'])

def continue_game
  data = YAML.load File.read('test1.yaml') 
  secret_word, guessed_word, score, bad_letters = data[0], data[1], data[2], data[3]
  print secret_word
  print guessed_word
  print score
  print bad_letters
  print good_letters
end

continue_game




