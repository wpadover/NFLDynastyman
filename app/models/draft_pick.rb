class DraftPick < ActiveRecord::Base

  belongs_to :fantasy_team
  validates :year, presence: true
  validates :round, presence: true

end
