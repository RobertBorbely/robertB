class Tag < ActiveRecord::Base
	has_many :taggings
	has_many :posts, through: :taggings

	def to_s
		title
	end

	def should_generate_new_friendly_id?
    	slug.blank? || title_changed?
  	end

	extend FriendlyId
	friendly_id :title, use: :slugged
end
