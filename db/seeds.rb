require_relative '../iron_news'
require 'faker'

def create_random
writer = Writer.create(name: Faker::Name.name, email: Faker::Internet.email)
writer.stories.create(title: Faker::Book.title, link: Faker::Internet.url, score: "2", comment_count: "3")
sleep(20)
end

100.times.map {create_random}
