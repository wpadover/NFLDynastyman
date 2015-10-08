class ChangeSalariesToDecimals < ActiveRecord::Migration
  def change
    change_column :contracts, :year_1_salary, :float
    change_column :contracts, :year_2_salary, :float
    change_column :contracts, :year_3_salary, :float
    change_column :contracts, :year_4_salary, :float
  end
end
