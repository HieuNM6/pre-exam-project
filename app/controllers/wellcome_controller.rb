class WellcomeController < ApplicationController
  def index
  	if params[:search]
  		@posts = Post.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
  	else
  		@posts = Post.all.paginate(:page => params[:page], :per_page => 10)
  	end


  end

  def signup
  end
end
