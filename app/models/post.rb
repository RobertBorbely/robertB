class Post < ActiveRecord::Base
	belongs_to :category

	extend FriendlyId
	friendly_id :title, use: :slugged
end
