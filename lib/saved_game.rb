# frozen_string_literal: true

require 'yaml'

def save_game(secret_word, guessed_word, bad_letters)
  data = [secret_word, guessed_word, bad_letters]
  File.open('test.yaml', 'w') do |file|
    file.puts YAML.dump data
  end
end

def continue_game
  if File.exist?('test.yaml')
    YAML.safe_load File.read('test.yaml')
  else
    puts 'The file is missing'
    abort
  end
end
