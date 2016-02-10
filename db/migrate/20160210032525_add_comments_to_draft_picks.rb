class AddCommentsToDraftPicks < ActiveRecord::Migration
  def change
    add_column :draft_picks, :comments, :string
  end
end
