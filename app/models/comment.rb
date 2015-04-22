class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user  # pointer to users table using the key user_id from the comments table
end
