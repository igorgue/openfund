# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create :email => "startupkids@gmail.com", :password => "111111", :password_confirmation => "111111"

campaigns = Campaign.create([
  {
    name: 'Screening: The Startup Kids',
    goal: '500',
    domain: 'miamistartupkids.com',
    tagline: 'A pre-screening of a documentary about young web entrepreneurs',
    start_time: 1.week.ago,
    show_link: true,
    user: user,
    video: '<iframe width="470" height="350" src="http://www.youtube.com/embed/ApUln7AD0_Q" frameborder="0" allowfullscreen></iframe>',
    blurb: 'We are trying to get a pre-screening played in Miami. It would be a great tech community-building activity.'
  }, {
    name: 'The Startup Kids Screening',
    goal: '750',
    domain: 'thestartupkids.com:3000',
    tagline: 'Watch the new docummentary about startups',
    start_time: 1.day.ago,
    show_link: true,
    user: user,
    video: '<iframe width="470" height="350" src="http://www.youtube.com/embed/ApUln7AD0_Q" frameborder="0" allowfullscreen></iframe>'
  }
])

levels = CampaignLevel.create([
  {
    campaign_id:campaigns[0].id,
    title: "Generous Donor",
    cost: "5.00"
  },
  {
    campaign_id:campaigns[0].id,
    title: "Friends & Family Sponsor",
    cost: "50.00"
  },
  {
    campaign_id:campaigns[0].id,
    title: "Seed Sponsor",
    cost: "100.00"
  },
  {
    campaign_id:campaigns[0].id,
    title: "Series A Sponsor",
    cost: "300.00"
  }
])

sections = CampaignSection.create([
  {
    campaign_id:campaigns[0].id,
    title: "Get in front of local entrepreneurs.",
    text: "The Startup Kids is a documentary about young web entrepreneurs in the U.S. and Europe. It contains interviews with the founders of Vimeo, Soundcloud, Kiip, InDinero, Dropbox, Foodspotting and many others who talk about how they started their company and their lives as an entrepreneur.",
    image_url: "http://cl.ly/image/2b2Y1V3t0w0a/Screen%20Shot%202012-10-14%20at%204.49.35%20PM.png"
  }
])

faqs = CampaignFaq.create([
  {
    campaign_id: campaigns[0].id,
    question: "Where will it be held?",
    answer: "More than likely a local university, who will host it for free."
  },
  {
    campaign_id: campaigns[0].id,
    question: "How much will it cost?",
    answer: "It's free for everyone. We will be releasing tickets through eventbrite!"
  },
  {
    campaign_id: campaigns[0].id,
    question: "When will it be?",
    answer: "Late fall, early winter at the latest."
  }
])