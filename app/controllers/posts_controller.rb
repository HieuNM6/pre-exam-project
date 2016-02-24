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
    @post = User.find(params[:id])
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to root_url
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
