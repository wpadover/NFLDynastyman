require "google/api_client"
require "google_drive"
require "mail"

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

def send_error_mail(error)
  Mail.deliver do
    from     'rosterimport@dynastyfootballmanager.com'
    to       'will.padover@gmail.com'
    subject  'Roster import failed'
    body     error
  end
end

def session

  # https://github.com/google/google-api-ruby-client/issues/253
  cert_path = Gem.loaded_specs['google-api-client'].full_gem_path+'/lib/cacerts.pem'
  ENV['SSL_CERT_FILE'] = cert_path

  client = Google::APIClient.new(application_name: 'DynastyFootballManager', application_version: '0.0.1')
  google_client_email = 'rosterimporter@dynasty-football-manager.iam.gserviceaccount.com'
  google_p12_file = 'data/key.p12'
  google_p12_secret = 'notasecret'

  key = Google::APIClient::KeyUtils.load_from_pkcs12(
      google_p12_file,
      google_p12_secret
  )

  scopes = [
    'https://docs.google.com/feeds/',
    'https://www.googleapis.com/auth/drive',
    'https://spreadsheets.google.com/feeds/'
  ]

  asserter = Google::APIClient::JWTAsserter.new(
      google_client_email,
      scopes,
      key
  )

  client.authorization = asserter.authorize

  GoogleDrive.login_with_oauth(client.authorization.access_token)

end

def spreadsheet(session)
  session.spreadsheet_by_key("1pR3a3QE5699ZlibZreraA4tpkMriC0TBs-HPEB48OKo").worksheets[0]
end

namespace :players do
  desc "Import a list of players from google drive spreadsheet"
  task :import => :environment do |t, args|

    fantasy_team_by_abbrev = FantasyTeam.all.reduce({}) do |obj, team|
      obj[team.abbreviation] = team
      obj
    end

    begin

      spreadsheet = spreadsheet(session)

      # Since we are wiping previous data each time,
      # make a transaction in case something fails
      recent_player = ''
      ActiveRecord::Base.transaction do

        # Wipe previous data
        Contract.destroy_all
        Player.destroy_all

        spreadsheet.rows.each do |row|
          team_abbreviation = row[ABBREVIATION_IDX]
            player = Player.create(
              last_name: row[LAST_NAME_IDX],
              first_name: row[FIRST_NAME_IDX],
              nfl_team_name: row[NFL_TEAM_IDX],
              position: row[POSITION_IDX],
              bye_week: row[BYE_WEEK_IDX]
            )
          recent_player = "#{player.first_name} #{player.last_name}"
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

    rescue Google::APIClient::ClientError=> e
      puts e
      send_error_mail "Error accessing spreadseet: #{e}"
    rescue Exception => e
      msg = "ERROR Parsing player #{recent_player}: #{e}"
      puts msg
      send_error_mail msg
    end

  end

end
