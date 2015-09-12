class FantasyTeamsController < ApplicationController

  def index
    @fantasy_teams = FantasyTeam.all
  end

end

