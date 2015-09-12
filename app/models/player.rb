class Player < ActiveRecord::Base
  has_one :contract
  has_one :player, through: :contract

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nfl_team_name, presence: true
  validates :position, presence: true

end
