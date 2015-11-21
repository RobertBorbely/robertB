class Post < ActiveRecord::Base
	belongs_to :category
	has_many :taggings
	has_many :tags, through: :taggings

	def tag_list
    	self.tags.collect do |tag|
      		tag.title
    	end.join(", ")
  	end

  	def tag_list=(tags_string)
  		tag_titles = tags_string.split(',').collect { |s| s.strip.downcase}.uniq
  		new_or_found_tags = tag_titles.collect { |title| Tag.find_or_create_by(title: title) }
  		self.tags = new_or_found_tags
  	end

  	def should_generate_new_friendly_id?
    	slug.blank? || title_changed?
  	end

	extend FriendlyId
	friendly_id :title, use: :slugged
end
