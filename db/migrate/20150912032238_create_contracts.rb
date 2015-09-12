class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :length
      t.integer :base_salary
      t.integer :start_year
      t.integer :fa_status
      t.integer :contract_status
      t.integer :fantasy_team_id
      t.integer :player_id

      t.timestamps null: false

      t.index :fantasy_team_id
      t.index :player_id
      t.index :fa_status
      t.index :contract_status
    end
  end
end
