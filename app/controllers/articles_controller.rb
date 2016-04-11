class ArticlesController < ApplicationController

	def blog
		@articles = Article.where(ended: true).page(params[:page]).per(6)
	end

	def show
		@article = Article.find(params[:id])
		@comment_count = @article.shiny_comments.size

	  if @article.nil?
    	render text: 'Wow... Arasay apologize, but page not found', status: 404
    else
      add_view
    end
	end

	def add_view
		@article = Article.find(params[:id])

		view = View.new
		view.article_id = params[:id]
		view.client_ip = request.remote_ip

		if current_user
		  view.user_id = current_user.id
		  if (View.find_by user_id: current_user.id).nil?
		  	@article.view_counter += 1
		  	@article.save
		    view.save 
		  end 
		else		  
		  if (View.find_by client_ip: request.remote_ip).nil?
		  	@article.view_counter += 1
		  	@article.save
		    view.save 
		  end
		end
	end

end
