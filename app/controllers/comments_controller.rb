class CommentsController < ApplicationController
  def index 
    @comments = Comment.all
  end
  def new
    @blog_post = BlogPost.find(params[:blog_post_id])
    @comment = @blog_post.comments.build
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @comment.blog_post, notice: "Comment created successfully."
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :blog_post_id)
  end
end