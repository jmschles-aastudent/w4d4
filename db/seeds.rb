# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Band.create( :name => "Megahead" )
Band.create( :name => "Deathfork" )
Band.create( :name => "Potato Palace" )

Album.create([{ :name => "Hairball", :year => "2002", :band => Band.first },
	{ :name => "Frustration", :year => "2013", :band => Band.first },
	{ :name => "Satisfaction", :year => "2001", :band => Band.first },
	{ :name => "Garlic", :year => "1999", :band => Band.find(2) }])

Track.create([{ :title => "Cats", :ord => 1, :album => Album.first },
	{ :title => "Dogs", :ord => 2, :album => Album.first },
	{ :title => "Hamsters", :ord => 3, :album => Album.first },
	{ :title => "Skulls", :ord => 1, :album => Album.find(2) },
	{ :title => "Crossbones", :ord => 2, :album => Album.find(2) }])