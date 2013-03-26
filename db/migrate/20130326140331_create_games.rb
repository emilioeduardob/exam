class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :session_id
      t.string :table

      t.timestamps
    end
  end
end
