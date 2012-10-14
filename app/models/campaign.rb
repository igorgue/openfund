# == Schema Information
#
# Table name: campaigns
#
#  id                :integer          not null, primary key
#  name              :string(255)      not null
#  goal              :decimal(8, 2)    not null
#  domain            :string(255)
#  tagline           :string(255)
#  secondary_tagline :string(255)
#  blurb             :text
#  start_time        :datetime
#  user_id           :integer
#  show_link         :boolean          default(TRUE)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  video             :text
#

class Campaign < ActiveRecord::Base
  attr_accessible :name, :goal, :domain, :tagline, :secondary_tagline, 
  								:blurb, :video, :start_time, :show_link, :user, :date
  
  attr_reader     :date, :time
  attr_writer     :date, :time
  
  belongs_to      :user
  has_many        :orders
  
  validates_uniqueness_of :domain

  def current_funds
    0.0
  end

  def active?
    start_time.present? and start_time <= Time.zone.now and (start_time + 30.days) >= Time.zone.now
  end

  def end_time
    start_time.present? ? start_time + 30.days : Time.zone.now
  end

  def days_left
    (Time.zone.now.to_date - (Time.zone.now + 5.days).to_date).to_i + 1
  end

  def full_domain
  	"http://#{domain}/"
  end

  def self.randy()
    if (c = Campaign.count) != 0
      Campaign.find(
      	:first, 
      	:conditions => { 
      		:users => {:stripe_livemode => true}, 
      		:start_time => Time.zone.parse("2012-10-01").midnight..Time.zone.now 
      	}, 
      	:joins => [:user], 
      	:offset => rand(c)
      )
    end
  end

  def progress
    0
  end

  def backers
    0
  end

  def days_left
    0
  end
end
