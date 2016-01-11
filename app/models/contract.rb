class Contract < ActiveRecord::Base

  belongs_to :fantasy_team
  belongs_to :player
  enum fa_status: [ :RFA, :UFA, :RENTAL ]
  enum contract_status: [:ACTIVE, :ROOKIE, :SSPD, :IR, :RETIRED ]

  validates :start_year, presence: true
  validates :fa_status, presence: true
  validates :contract_status, presence: true
  validates :fantasy_team_id, presence: true
  validates :player_id, presence: true, uniqueness: true

end
