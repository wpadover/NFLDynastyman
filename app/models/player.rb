class Player < ActiveRecord::Base
  has_one :contract

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nfl_team_name, presence: true
  validates :position, presence: true

  def nfl_team_name=(s)
    write_attribute(:nfl_team_name, s.to_s.upcase)
  end

  def position=(s)
    write_attribute(:position, s.to_s.upcase)
  end

end
