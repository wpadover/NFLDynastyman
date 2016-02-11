class FantasyTeam < ActiveRecord::Base
  has_many :contracts
  has_many :draft_picks
  has_many :players, through: :contracts

  validates :owner_name, presence: true, uniqueness: { case_sensitive: false }

  validates :team_name, presence: true, uniqueness: { case_sensitive: false }

  def espn_link
    "http://games.espn.go.com/ffl/clubhouse?leagueId=#{Constant.league_id}&teamId=#{espn_id}&seasonId=#{Constant.current_season}"
  end

  def active_total_contract_length
    self.contracts.where(contract_status: "ACTIVE").sum("length")
  end

  def active_total_salary
    self.contracts.where(contract_status: "ACTIVE").sum("year_1_salary").round(2)
  end

  def number_of_active_players
    self.contracts.where(contract_status: "ACTIVE").where("length > ?", 0).count

  end


end
