require 'yaml'

def save_game(secret_word, guessed_word, i, bad_letters)
  data = [secret_word, guessed_word, i, bad_letters]
  File.open('test.yaml', 'w') do |file|
    file.puts YAML.dump data
  end
end

def continue_game
  if File.exists?('test.yaml')
    data = YAML.load File.read('test.yaml') 
  else
    puts 'The file is missing'
    abort
  end
end





