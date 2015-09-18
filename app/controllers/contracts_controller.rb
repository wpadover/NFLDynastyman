class ContractsController < ApplicationController

  def index
    @contracts = Contract.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contracts.to_json(:include => [:player, :fantasy_team]) }
    end
  end

end

