class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :nfl_team_name
      t.string :position

      t.timestamps null: false

      t.index :nfl_team_name
      t.index :position
    end
  end
end
