module Paginator

def paginate(models, per_page, page)

	#paginate(page: params[:page], per_page: 10)
	#@per_page = page Topic.limit(10).offset(10)
	#@page = Topic.limit(page: params[:page], per_page: 10)
	#@topics = Topic.paginate(page: params[:page], per_page: 10)
	#@posts = @topic.posts.paginate(page: params[:page], per_page: 10)

	models.limit(per_page).offset(page * per_page)

end