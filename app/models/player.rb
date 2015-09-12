class Player < ActiveRecord::Base
  has_one :contract
  has_one :player, through: :contract
end
