require 'sinatra'
require 'sinatra/reloader'
require 'kaminari/sinatra'
require 'padrino-helpers'
require 'active_record'
require 'action_view'
require 'action_view/helpers'
require 'uri'
include ActionView::Helpers::DateHelper
register Kaminari::Helpers::SinatraHelpers


ActiveRecord::Base.establish_connection(
'adapter' => "sqlite3",
'database' => "store.sqlite3"
)


class Writer < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  has_many :stories
  has_many :comments
  validates :name, presence: true
  validates :email, presence: true, format: VALID_EMAIL_REGEX
end

class Story < ActiveRecord::Base
  belongs_to :writer
  has_many :comments
  validates :link, presence: true
  validates :title, presence: true
end

class Comment < ActiveRecord::Base
  belongs_to :writer
  belongs_to :story
end

def pagination
  if params[:page].nil? || params[:page] == "0" || params[:page] == "1"
    @count = 0
  else
    page = params[:page].to_i - 1
    @count = page * 25
  end
end

get '/news' do
  erb :news
end

get '/new' do
  pagination
  @stories_by_date = Story.all.order('created_at desc').page(params[:page])
  erb :newest
end

get '/submit' do
  erb :submit
end

post '/submit' do
  url = params['link']
  name = params['name']
  title = params['title']
  email = params['email']
  writer = Writer.find_or_create_by(name: name, email: email)
  story = writer.stories.create(title: title, link: url)

  if writer.valid? && story.valid?
    redirect '/news'
  else
    redirect '/error'
  end
  erb :submit
end

get '/comment' do
  @id = params['id']
  @found_story = Story.where(id: @id)
  @found_comment = Comment.where(story_id: @id)
  erb :comment
end

post '/comment' do
  story_id = params['parent']
  comment = params['comment']
  name = params['name']
  email = params['email']
  writer = Writer.find_or_create_by(name: name, email: email)
  writer.comments.create(comment: comment, story_id: story_id)
  redirect back
end

get '/newcomments' do
  pagination
  @stories_by_date = Story.all.order('created_at desc').page(params[:page])
  erb :newcomments
end

get '/vote' do
  story_id = params['for']
  story = Story.find_by(id: story_id)
   votes = story.score + 1
   story.update(score: votes)
   redirect back
end
