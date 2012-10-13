# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
campaign = Campaign.new(
  name: 'Lockitron',
  goal: '10000.00',
  domain: 'lockitron.com',
  tagline: 'Keyless entry using your phone',
  secondary_tagline: 'Lock your door from anywhere in the world',
  start_time: 1.week.ago,
  show_link: true
)

campaign.save
