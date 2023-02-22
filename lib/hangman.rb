require 'yaml'

def save_game(secret_word, guessed_word, i, bad_letters)
  data = [secret_word, guessed_word, i, bad_letters]
  File.open('test1.yaml', 'w') do |file|
    file.puts YAML.dump data
  end
end

def continue_game
  data = YAML.load File.read('test1.yaml') 
end





