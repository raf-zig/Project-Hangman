# frozen_string_literal: true

def print_man(i)
  case i
  when 1
    puts '
     |
    ( )'
  when 2
    puts '
     |
    ( )
     |'
  when 3
    puts '
     |
    ( )
     |
      \\'
  when 4
    puts '
     |
    ( )
     |
    / \\'
  when 5
    puts '
     |
    ( )
     |
    /|\
     |'
  when 6
    puts '
     |
    ( )
     |
    /|\
     |
      \\'
  when 7
    puts '
     |
    ( )
     |
    /|\
     |
    / \\'
  end
end
