class FantasyTeam < ActiveRecord::Base
  has_many :contracts
  has_many :players, through: :contracts

  validates :owner_name, presence: true, uniqueness: { case_sensitive: false }

  validates :team_name, presence: true, uniqueness: { case_sensitive: false }
end
