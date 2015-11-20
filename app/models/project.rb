class Project < ActiveRecord::Base

	def should_generate_new_friendly_id?
    	slug.blank? || title_changed?
  	end
  	
	extend FriendlyId
	friendly_id :title, use: :slugged
end
