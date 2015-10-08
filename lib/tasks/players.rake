require 'csv'

ABBREVIATION_IDX=0
LAST_NAME_IDX=1
FIRST_NAME_IDX=2
POSITION_IDX=3
NFL_TEAM_IDX=4
BYE_WEEK_IDX=5
CONTRACT_LENGTH_IDX=6
YEAR_1_SALARY_IDX=7
YEAR_2_SALARY_IDX=8
YEAR_3_SALARY_IDX=9
YEAR_4_SALARY_IDX=10
FA_STATUS_IDX=11
CONTRACT_STATUS_IDX=12

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
        player = Player.create(
          last_name: row[LAST_NAME_IDX],
          first_name: row[FIRST_NAME_IDX],
          nfl_team_name: row[NFL_TEAM_IDX],
          position: row[POSITION_IDX],
          bye_week: row[BYE_WEEK_IDX]
        )
      if fantasy_team_by_abbrev[team_abbreviation]
        team = fantasy_team_by_abbrev[team_abbreviation]
        puts "Creating contract for #{player.first_name} #{player.last_name}"
        team.contracts.create(
          player: player,
          length: row[CONTRACT_LENGTH_IDX],
          year_1_salary: row[YEAR_1_SALARY_IDX],
          year_2_salary: row[YEAR_2_SALARY_IDX],
          year_3_salary: row[YEAR_3_SALARY_IDX],
          year_4_salary: row[YEAR_4_SALARY_IDX],
          fa_status: row[FA_STATUS_IDX].upcase,
          contract_status: row[CONTRACT_STATUS_IDX].upcase,
          start_year: 2015
        )
      end
    end

  end

end
