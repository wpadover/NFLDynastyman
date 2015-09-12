class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :length
      t.integer :base_salary
      t.integer :start_year
      t.integer :fa_status
      t.integer :contract_status

      t.references :player, index: true, unique:true, foreign_key: true
      t.references :fantasy_team, index: true, foreign_key: true

      t.timestamps null: false

      t.index :fa_status
      t.index :contract_status
    end
  end
end
