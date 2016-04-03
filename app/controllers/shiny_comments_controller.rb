class ShinyCommentsController < ApplicationController

	def index
    @comment  = ShinyComment.new
    @comments = ShinyComment.where(article_id: params[:article_id])

    @comments = get_second_lvl_comments @comments

    unless current_user.nil?
      @user_comments_id = Like.where(user_id: current_user.id).pluck(:comment_id)
    end

		@article_title = Article.find(params[:article_id]).title
	end

	def create
    @comment = ShinyComment.new(shiny_comment_params)
    @comment[:user_id] = current_user.id


    if @comment.body.blank?
      flash[:notice] = 'Комментарий не может быть пустым'
    else
      @comment.save
      flash[:notice] = 'Ваш комменарий будет опубликован сразу после премодерации'

      article = Article.find(shiny_comment_params[:article_id])
      article.comment_counter += 1
      article.save
    end

    redirect_to :back
	end

  def new_sub_comment # AJAX
    @comment = ShinyComment.new
    @parent_comment_id = params[:parent_comment_id]

    # respond_to do |format|
    #   format.js  
    # end
  end

  def create_sub_comment # AJAX
    @comment = ShinyComment.new(shiny_comment_params)
    @comment[:user_id] = current_user.id
    

    if @comment.body.nil?
      redirect_to :back
    else
      @comment.save

      cmnt = ShinyComment.find(shiny_comment_params[:comment_id])
      article = Article.find(cmnt.article_id)
      article.comment_counter += 1
      article.save

      redirect_to :back
    end

  end


  def comment_like
    if current_user.nil?
      redirect_to :back
    else
      @comment = ShinyComment.find(params[:format])
      @comment.likes += 1
      @comment.save
      @like = Like.create(comment_id: params[:format], user_id: current_user.id)
      redirect_to :back
    end
  end

  def comment_dislike
    if current_user.nil?
      redirect_to :back
    else
      @comment = ShinyComment.find(params[:format])
      @comment.likes -= 1
      @comment.save
      @like = Like.create(comment_id: params[:format], user_id: current_user.id)
      redirect_to :back
    end
  end

  def get_second_lvl_comments arr
    @ids_for_subcomments = arr.pluck(:id)
    @sub_comments = ShinyComment.where(comment_id: @ids_for_subcomments)

    @second_lvl_comments_arr = []

    arr.each do |cmnt|
      sub_cmnts_for_cmnt = @sub_comments.find_all{ |elem| elem.comment_id == cmnt.id } 

      arr_elem = [cmnt, sub_cmnts_for_cmnt]
      @second_lvl_comments_arr << arr_elem

    end

    @second_lvl_comments_arr 
  end

  private

	def shiny_comment_params
    params.require(:shiny_comment).permit(:body, :article_id, :comment_id)
  end

end
