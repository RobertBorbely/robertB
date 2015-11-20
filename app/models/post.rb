class Post < ActiveRecord::Base
	belongs_to :category
	has_and_belongs_to_many :tags

	extend FriendlyId
	friendly_id :title, use: :slugged
end
