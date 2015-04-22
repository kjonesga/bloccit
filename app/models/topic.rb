class Topic < ActiveRecord::Base
	has_many :posts, dependent: :destroy # reference to the posts table, where topic.id is the foreign key in the posts table
	validates :name, length: {minimum: 5}
end
