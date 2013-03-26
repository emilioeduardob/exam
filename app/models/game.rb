class Game < ActiveRecord::Base
  attr_accessible :session_id, :table
  serialize :table, Array
end
