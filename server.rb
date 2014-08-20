require 'sinatra'
require 'csv'
require 'pry'

############ METHODS ###############

def roster_list (rosterfile)
  roster = []

  CSV.foreach(rosterfile, headers: true) do |row|
    roster << row.to_hash
  end

  roster
end

def team_names(roster)
  teams = []
    roster.each do |player|
    teams << player["team"]
  end
  teams.uniq!
end

def position_names(roster)
  positions = []
    roster.each do |player|
    positions << player["position"]
  end
  positions.uniq!
end

############# PROGRAM ###############

roster = roster_list('lackp_starting_rosters.csv')

set :public_folder, File.dirname(__FILE__) + '/public'

get '/' do
  @teams = team_names(roster)
  @positions = position_names(roster)

  erb :index
end

get '/teams/:team_name' do
  @teamname = params[:team_name]
  @roster = roster
  erb :team
end

get '/positions/:position' do
  @position_title = params[:position]
  @roster = roster

  erb :position
end
