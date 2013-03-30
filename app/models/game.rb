class Game < ActiveRecord::Base
  attr_accessible :session_id, :table
  serialize :table, Array
  attr_accessor :winner

  USER_SYMBOL = 'X'
  SERVER_SYMBOL = 'O'

  #returns game status
  def status
    {
      winner: @winner,
      table: self.table
    }
  end

  def init_table
    self.table << [nil,nil,nil]
    self.table << [nil,nil,nil]
    self.table << [nil,nil,nil]
    self.save!
  end

  # plays the symbol and positions Ejem. X: [0,1]
  def play(new_mark)
    init_table if self.table.empty?

    indices = new_mark.split(',').map{|i| i.to_i}

    self.table[indices.first][indices.last] = 'X'

    if user_won?
      @winner = "Usuario gano"
    else
      #let server play
      server_play
      @winner = "Server gano" if server_won?
    end
    self.save!
  end

  def server_play
    indices = choose_cell
    self.table[indices.first][indices.last] if indices

  end

  def choose_cell
    0.upto(2) do |vertical_i|
      0.upto(2) do |horizontal_i|
        indices = [vertical_i, horizontal_i] 
        cell_value = self.table[indices.first][indices.last]
        if cell_value.nil?
          self.table[indices.first][indices.last] = 'O'
          return indices 
        end
      end
    end
    false
  end

  def cancel
    self.table = []
    init_table
  end

  def server_won?
    check_diagonal_win(SERVER_SYMBOL) || check_vertical_win(SERVER_SYMBOL) || check_horizontal_win(SERVER_SYMBOL)
  end

  def user_won?
    check_diagonal_win(USER_SYMBOL) || check_vertical_win(USER_SYMBOL) || check_horizontal_win(USER_SYMBOL)
  end

  #check for diagonal wins
  def check_diagonal_win(symbol)
  end

  #check for vertical wins
  def check_vertical_win(symbol)
    0.upto(2).each do |column|
      return true if self.table[0][column] == symbol && self.table[1][column] == symbol && self.table[2][column] == symbol
    end
    false
  end

  #check for horizontal wins
  def check_horizontal_win(symbol)
    self.table.each do |row|
      return true if row[0] == symbol && row[1] == symbol && row[2] == symbol
    end
    false
  end
end
