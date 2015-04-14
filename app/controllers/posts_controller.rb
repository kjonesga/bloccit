class PostsController < ApplicationController
 
  def index
  #	  @posts = Post.all
   #    authorize @posts
   #@posts = policy_scope(Post)
  end

  def show
  	@post = Post.find(params[:id])
       @topic = Topic.find(params[:topic_id])
       @comment = Comment.new
       @comment.post = @post
  end

  def new
       @topic = Topic.find(params[:topic_id])
    @post = Post.new

      authorize @post
  end
     def create
        @topic = Topic.find(params[:topic_id])

        #@post = current_user.posts.build(params.require(:post).permit(:title, :body))
        # 1. we worked directly from the resource relevant to this controller
    
        @post_a = Post.new(params.require(:post).permit(:title, :body))


        # 2. we assigned the things that relate to the post here, user and topic
        @post_a.user = current_user
        @post_a.topic = @topic
        
        authorize @post_a

        
     if @post_a.save
       flash[:notice] = "Post was saved."
       redirect_to topic_post_path(@topic, @post_a)
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
     end
   end


  def edit
      @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end

   def update
       @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
     authorize @post
      if @post.update_attributes(params.require(:post).permit(:title, :body))
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
   end



end
