class FantasyTeamsController < ApplicationController

  def index
    @fantasy_teams = FantasyTeam.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fantasy_teams.as_json(methods: [:active_total_contract_length, :active_total_salary, :number_of_active_players])}
    end
  end

  def show
    @fantasy_team = FantasyTeam.find_by(id: params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fantasy_team.to_json(:include => [ {:contracts => { :include => :player } }, :draft_picks ] ) }
    end
  end

end

