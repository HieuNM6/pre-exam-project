class PostsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def create
    @post = current_user.post.build(post_params)
    @post.views = 0
    if @post.save
      flash[:success] = "Posting successful"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to root_url
  end

  def edit
    search
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated"
      redirect_to @post
    else
      render 'edit'
    end
  end  

  def show
    search
    @post = Post.find(params[:id])
    @post.views = @post.views + 1
    @post.save

  end

  def new 
    search
    @post = current_user.post.build 
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
    end

    def correct_user
      @post = Post.find(params[:id])
      @user = User.find(@post.user_id)
      if current_user.id == 1

      else
        unless current_user?(@user)
          flash[:danger] = "Permissions denied!"
          redirect_to(@post)
        end
      end
    end

end
