# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Place.create(name: 'East Rock')
Place.create(name: 'Central Campus')
Place.create(name: 'Downtown')
Place.create(name: 'West Campus')

Weekday.create(name: 'Monday')
Weekday.create(name: 'Tuesday')
Weekday.create(name: 'Wednesday')
Weekday.create(name: 'Thursday')
Weekday.create(name: 'Friday')
Weekday.create(name: 'Saturday')
Weekday.create(name: 'Sunday')

Opening.create(name: 'Morning')
Opening.create(name: 'Afternoon')
Opening.create(name: 'Evening')