class FantasyTeam < ActiveRecord::Base
  has_many :contracts
  has_many :players, through: :contracts

  validates :owner_name, presence: true, uniqueness: { case_sensitive: false }

  validates :team_name, presence: true, uniqueness: { case_sensitive: false }

  def espn_link
    "http://games.espn.go.com/ffl/clubhouse?leagueId=#{Constant.league_id}&teamId=#{espn_id}&seasonId=#{Constant.current_season}"
  end

end
