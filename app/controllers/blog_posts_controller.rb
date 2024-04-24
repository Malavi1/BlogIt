class BlogPostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_blog_post, except: [:index, :new, :create] 
    def index 
        @blog_posts = BlogPost.paginate(page: params[:page], per_page: 4) 
    end
    def show 
        @blog_post = BlogPost.find(params[:id])
        @comment = Comment.new(blog_post: @blog_post)       
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end
    def new 
        @blog_post = BlogPost.new
    end
    def create 
        @blog_post = current_user.blog_posts.build(blog_post_params)
        if @blog_post.save
            redirect_to @blog_post
        else 
            puts @blog_post.errors.full_messages
            render :new, status: :unprocessable_entity
        end
    end
    def edit 
        @blog_post = BlogPost.find(params[:id])
    end
    def update 
        @blog_post = BlogPost.find(params[:id])
        if @blog_post.update(blog_post_params)
            redirect_to @blog_post
        else
            render :edit 
        end
    end 
    def destroy 
        @blog_post = BlogPost.find(params[:id])
        @blog_post.destroy 
        redirect_to root_path
    end
    private
    def blog_post_params 
        params.require(:blog_post).permit(:title, :body, :user_id)
    end
    def set_blog_post  
        @blog_post = BlogPost.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end
end