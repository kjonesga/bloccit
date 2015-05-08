class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	has_many :votes, dependent: :destroy
	has_one :summary
	belongs_to :user
	belongs_to :topic

	mount_uploader :images, AvatarUploader

	default_scope { order('rank DESC') }
	scope :ordered_by_title, -> { order(title: :desc) }
	scope :ordered_by_reverse_created_at, -> {order(created_at: :desc)}

	  validates :title, length: {minimum: 5}, presence: true
	  validates :body, length: {minimum: 20}, presence: true
	  #validates :topic, presence: true
	  #validates :user, presence: true

	  def post_params
	  	params.require(:post).permit(:image)
	  end

	  def up_votes
	  	votes.where(value: 1).count
	  end

	  def down_votes
	  	votes.where(value: -1).count
	  end

	  def points
	  	votes.sum(:value)
	  end

	  def update_rank
	    age_in_days = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24 )
	    new_rank = points + age_in_days

	    update_attribute(:rank, new_rank)

	  end
end


	#scope :ordered_by_field, -> (field) { order("#{field} DESC") }

