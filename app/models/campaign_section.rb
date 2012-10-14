# == Schema Information
#
# Table name: campaign_sections
#
#  id                 :integer          not null, primary key
#  campaign_id        :integer
#  title              :string(255)      not null
#  text               :text             default(""), not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  sort_order         :integer          default(0)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  type               :string(19)
#

class CampaignSection < ActiveRecord::Base
  attr_accessible :campaign_id, :title, :text, :type, :image_url

  validates_attachment :image, 
  	:content_type => { :content_type => ["image/jpg", "image/png", "image/gif"] }
  has_attached_file :image, :styles => { :desktop => "800x180>", :mobile => "640x140>" }
end
