require 'spec_helper'

describe Game do
  it "has a valid factory" do 
    game = build(:game)
    expect(game).to be_valid
  end

  before do
    @game = create(:game)
  end

  describe "game#user_won?" do
    it "returns true if horizontal match" do
      @game.table = [['X','X','X'], [nil, nil, nil], [nil, 'X', nil]]
      expect(@game.user_won?).to be_true

      @game.table = [[nil, nil, nil], ['X','X','X'], [nil, nil, nil]]
      expect(@game.user_won?).to be_true
      
      @game.table = [['O','O','O'], [nil, 'O', nil], [nil, nil, nil]]
      expect(@game.user_won?).to be_false
    end

    it "returns true if diagonal match" do
      @game.table = [['X',nil, nil], [nil, 'X', nil], [nil, nil, 'X']]
      expect(@game.user_won?).to be_true

      @game.table = [[nil,nil, 'X'], [nil, 'X', nil], ['X', nil, nil]]
      expect(@game.user_won?).to be_true
      
      @game.table = [[nil,nil, 'O'], [nil, 'O', nil], ['O', nil, nil]]
      expect(@game.user_won?).to be_false
    end

    it "returns true if vertical match" do
      @game.table = [[nil,'X',nil], [nil, 'X', nil], [nil, 'X', nil]]
      expect(@game.user_won?).to be_true

      @game.table = [['X',nil,nil], ['X', nil, nil], ['X', nil, nil]]
      expect(@game.user_won?).to be_true
      
      @game.table = [[nil,'O',nil], [nil, 'O', nil], [nil, 'O', nil]]
      expect(@game.user_won?).to be_false
    end

    it "returns false if all nil" do
      @game.table = [[nil,nil,nil], [nil, nil, nil], [nil, nil, nil]]
      expect(@game.user_won?).to be_false
    end
  end

  describe "game#init_table" do
    it "sets nil to all cells" do
      @game.table = [['X',nil,nil], ['O', nil, nil], [nil, 'X', nil]]
      @game.init_table
      expect(@game.table).to have(3).items
      @game.table.each do |row|
        row.each do |cell|
          expect(cell).to be_nil
        end
      end
    end

    it "inits the array if its null" do
      @game.table = nil
      @game.init_table
      expect(@game.table).to have(3).items
      expect(@game.table[0]).to have(3).items
      expect(@game.table[1]).to have(3).items
      expect(@game.table[2]).to have(3).items
    end

  end
end
