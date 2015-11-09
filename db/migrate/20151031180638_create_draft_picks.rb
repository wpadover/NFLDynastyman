class CreateDraftPicks < ActiveRecord::Migration
  def change
    create_table :draft_picks do |t|
      t.integer :year
      t.integer :round
      t.string :pick
      t.references :fantasy_team, index: true, foreign_key: true

      t.timestamps null: false
      t.index :year
    end
  end
end
