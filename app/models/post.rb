class Post < ActiveRecord::Base
	has_many :comments
	belongs_to :user
	   belongs_to :topic
	has_one :summary   
	#default_scope { order('created_at DESC') }
	scope :ordered_by_title, -> { order(title: :desc) }
	scope :ordered_by_reverse_created_at, -> {order(created_at: :desc)}
end


	#scope :ordered_by_field, -> (field) { order("#{field} DESC") }