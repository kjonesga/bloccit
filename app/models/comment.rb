class Comment < ActiveRecord::Base
  belongs_to :user

  validates :body, length: {minimum: 20}, presence: true
  validates :user, presence: true
end
