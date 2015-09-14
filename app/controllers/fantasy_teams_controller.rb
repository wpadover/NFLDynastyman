class FantasyTeamsController < ApplicationController

  def index
    @fantasy_teams = FantasyTeam.all
  end

  def show
    @fantasy_team = FantasyTeam.find_by(id: params[:id])
  end

end

