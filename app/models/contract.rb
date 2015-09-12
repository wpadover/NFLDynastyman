class Contract < ActiveRecord::Base
  belongs_to :fantasy_team
  belongs_to :player
  enum fa_status: [ :rfa, :ufa ]
  enum contract_status: [:active, :rookie, :sspd, :ir]

end
