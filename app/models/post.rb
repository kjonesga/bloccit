class Post < ActiveRecord::Base
	has_many :comments
	belongs_to :user
	   belongs_to :topic
	has_one :summary   
	#default_scope { order('created_at DESC') }
	scope :ordered_by_title, -> { order(title: :desc) }
	scope :ordered_by_reverse_created_at, -> {order(created_at: :desc)}

	  validates :title, length: {minimum: 5}, presence: true
	  validates :body, length: {minimum: 20}, presence: true
	  validates :topic, presence: true
	  validates :user, presence: true
end


	#scope :ordered_by_field, -> (field) { order("#{field} DESC") }