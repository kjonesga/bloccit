class CommentsController < ApplicationController
  def create
  	# 1. we worked directly from the resource relevant to this controller
    #@post_a = Post.new(params.require(:post).permit(:title, :body))

        # 2. we assigned the things that relate to the post here, user and topic
        @post_a.user = current_user
        @post_a.topic = @topic
       

       @post = Post.find(params[:post_id])
       @comment = Comment.new(params.require(:comment).permit(:body))
         @comment.user = current_user
         

         validates :body, length {minimun: 20}, presence: true
         validates :user, presence: true

  end
end