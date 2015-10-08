class AddSalariesByYearToContracts < ActiveRecord::Migration
  def change
    change_table :contracts do |t|
      t.remove :base_salary
      t.integer :year_1_salary
      t.integer :year_2_salary
      t.integer :year_3_salary
      t.integer :year_4_salary
    end
  end
end
