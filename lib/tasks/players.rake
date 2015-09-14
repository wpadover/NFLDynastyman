require 'csv'

ABBREVIATION_IDX=0
LAST_NAME_IDX=1
FIRST_NAME_IDX=2
POSITION_IDX=3
NFL_TEAM_IDX=4
CONTRACT_LENGTH_IDX=5
BASE_SALARY_IDX=6
FA_STATUS_IDX=10
CONTRACT_STATUS_IDX=11

namespace :players do
  desc "TODO"
  task :import, [:file] => [:environment] do |t, args|
    filename = args[:file]
    if !filename
      throw 'You must supply csv file'
    end

    fantasy_team_by_abbrev = FantasyTeam.all.reduce({}) do |obj, team|
      obj[team.abbreviation] = team
      obj
    end

    csv = CSV.read(filename)
    csv.shift
    csv.each do |row|
      team_abbreviation = row[ABBREVIATION_IDX]
        player = Player.create(last_name: row[LAST_NAME_IDX], first_name: row[FIRST_NAME_IDX], nfl_team_name: row[NFL_TEAM_IDX], position: row[POSITION_IDX])
      if fantasy_team_by_abbrev[team_abbreviation]
        team = fantasy_team_by_abbrev[team_abbreviation]
        team.contracts.create(player: player, length: row[CONTRACT_LENGTH_IDX], base_salary: row[BASE_SALARY_IDX], fa_status: row[FA_STATUS_IDX], contract_status: row[CONTRACT_STATUS_IDX], start_year: 2015)
      end
    end

  end

end
