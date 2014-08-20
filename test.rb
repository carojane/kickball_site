
require 'csv'
require 'pry'

roster = []

CSV.foreach('lackp_starting_rosters.csv', headers: true) do |row|
  roster << row.to_hash
end


  @teams = []
  @positions = []
  roster.each do |player|
    @teams << player["team"]
    @positions << player["position"]
  end
  p @teams.uniq!
  p @positions.uniq!

