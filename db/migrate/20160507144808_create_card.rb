class CreateCard < ActiveRecord::Migration
  def change
    create_table :cards do |t|
    	t.integer :player_id
    	t.integer :suite
    	t.integer :deck
    	t.integer :number
    end
  end
end
