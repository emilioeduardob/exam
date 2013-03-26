class Game < ActiveRecord::Base
  attr_accessible :session_id, :table
  serialize :table, Array

  USER_SYMBOL = 'X'

  #returns game status
  def status
    {
      winner: self.get_winner,
      table: {}
    }
  end

  #returns nil if no winner or word DRAW
  def get_winner
  end

  # plays the symbol and positions Ejem. X: [0,1]
  def play(new_mark)
  end

  def user_won?
    check_diagonal_win(USER_SYMBOL) || check_vertical_win(USER_SYMBOL) || check_horizontal_win(USER_SYMBOL)
  end

  #check for diagonal wins
  def check_diagonal_win(symbol)
  end

  #check for vertical wins
  def check_vertical_win(symbol)
  end

  #check for horizontal wins
  def check_horizontal_win(symbol)
  end
end
