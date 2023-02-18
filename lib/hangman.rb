require 'yaml'
def save_game(secret_word, guessed_word, score, bad_letters)
  puts 'Do you want to save the game? (y/n)'
  form_letter = [secret_word, guessed_word, score, bad_letters]
  File.open('test1.yaml', 'w') do |file|
    file.puts YAML.dump form_letter
  end
  puts YAML.load File.read('test1.yaml') 
end
save_game(['k', 'f'], ['g', 'r'], 5, ['w', 'v'])




