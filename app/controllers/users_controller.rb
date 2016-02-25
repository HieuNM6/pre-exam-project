class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def index
    search
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    search
    @posts = Post.where("user_id=?", @user.id)
  end

  def new
    search
		@user = User.new
  end

	def create
		@user = User.new(user_params)
		if @user.save
      log_in @user
			flash[:success] = "Wellcome to the sharing stories app!"
			redirect_to @user
		else
			render 'new'
		end
	end

  def edit
    search
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end


	private
		def user_params
			params.require(:user).permit(:name,:email, :password,
																								 :password_confirmation)
		end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      if current_user.id == 1

      else
        unless current_user?(@user)
          flash[:danger] = "Permissions denied!"
          redirect_to(@user)
        end
      end
    end
end
