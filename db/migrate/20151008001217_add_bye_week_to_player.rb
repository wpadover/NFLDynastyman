class AddByeWeekToPlayer < ActiveRecord::Migration
  def change
    change_table :players do |t|
      t.integer :bye_week
    end
  end
end
