class TopicsController < ApplicationController
  #include Paginate

  def index
    #@topics = Topic.paginate(page: params[:page], per_page: 10)
    #@topics = Topic.all.limit(10).offset(params[:page].to_i * 10)
    @topics = paginate(Topic.all, 3, params[:page].to_i)
    #https://www.bloc.io/users/kendric-jones-2/checkpoints/316?page=1&page_offset=10

  	authorize = @topics
  end

  def paginate(models, per_page, page)
    models.limit(per_page).offset(page * per_page)
  end

  def new
  	@topic = Topic.new
  	authorize @topic
  end

  def show
    @topic = Topic.find(params[:id])
     @posts = @topic.posts.paginate(page: params[:page], per_page: 10)
    authorize @topic
  end

  def edit
  	@topic = Topic.find(params[:id])
  	authorize @topic
  end

    def create
     @topic = Topic.new(params.require(:topic).permit(:name, :description, :public))
     authorize @topic
     if @topic.save
       redirect_to @topic, notice: "Topic was saved successfully."
     else
       flash[:error] = "Error creating topic. Please try again."
       render :new
     end
   end
 
   def update
     @topic = Topic.find(params[:id])
     authorize @topic
     if @topic.update_attributes(params.require(:topic).permit(:name, :description, :public))
       redirect_to @topic
     else
       flash[:error] = "Error saving topic. Please try again."
       render :edit
     end
   end
end


