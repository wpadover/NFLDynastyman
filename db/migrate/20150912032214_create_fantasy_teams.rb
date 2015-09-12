class CreateFantasyTeams < ActiveRecord::Migration
  def change
    create_table :fantasy_teams do |t|
      t.string :owner_name
      t.string :team_name

      t.timestamps null: false
    end
  end
end
