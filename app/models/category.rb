class Category < ActiveRecord::Base
	validates :title, presence: true, uniqueness: true
	
	has_many :posts, dependent: :delete_all

	def should_generate_new_friendly_id?
    	slug.blank? || title_changed?
  	end

	extend FriendlyId
	friendly_id :title, use: :slugged
end
