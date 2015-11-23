require 'faker'

namespace :db do

	desc "Fill database with sample posts and projects"
	task :populate => :environment do
		
		Rake::Task['db:reset'].invoke
		id = 0
		3.times do |n|
			title = Faker::Lorem.word
			Category.create!(:title => title)
			id += 1
			5.times do |n|
				title = Faker::Lorem.sentence(3)
				content = Faker::Lorem.paragraph(50)
				Post.create!(:title => title,
						:content => content,
						:category_id => id)
		end
		end
		15.times do |n|
			title = Faker::Lorem.sentence(3)
			content = Faker::Lorem.paragraph(50)
			Project.create!(:title => title,
						:description => content)
		end

		Post.find_each(&:save)
		Project.find_each(&:save)
		Category.find_each(&:save)

		User.create(email: "asd@lol.hu", password: 123456789)
	end
end