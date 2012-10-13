# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new({:email => "startupkids@gmail.com", :password => "111111", :password_confirmation => "111111"})
user.save

campaign = Campaign.new(
  name: 'The Startup Kids Screening',
  goal: '750',
  domain: 'thestartupkids.com',
  tagline: 'Watch the new docummentary about startups',
  start_time: 1.week.ago,
  show_link: true,
  user: user
)
campaign.save
