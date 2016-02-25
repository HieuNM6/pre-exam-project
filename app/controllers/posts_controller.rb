class PostsController < ApplicationController


  def create
    @post = current_user.post.build(post_params)
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
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @post
    else
      render 'edit'
    end
  end  

  def show
    @post = Post.find(params[:id])
  end

  def new 
    @post = current_user.post.build 
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end

end
