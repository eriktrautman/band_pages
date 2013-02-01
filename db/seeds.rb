# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

artists = [
  "Erik BoBerik",
  "Lars Olaf",
  "Bill Kidd",
  "Joe Black" ]

artists.each do |artist|
  a = Artist.new
  a.first_name = artist.split(" ").first
  a.last_name = artist.split(" ").last
  a.save
end