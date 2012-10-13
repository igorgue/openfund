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
#

class Campaign < ActiveRecord::Base
  # attr_accessible :title, :body
end
