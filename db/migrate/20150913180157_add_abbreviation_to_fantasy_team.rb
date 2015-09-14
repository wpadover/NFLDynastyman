class AddAbbreviationToFantasyTeam < ActiveRecord::Migration
  def change
    add_column :fantasy_teams, :abbreviation, :string
    add_index :fantasy_teams, :abbreviation, unique: true
  end
end
