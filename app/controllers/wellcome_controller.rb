class WellcomeController < ApplicationController
  def index
  	@posts = Post.all
  	if params[:search]
  		@posts = Post.search(params[:search])
  	else
  		@posts = Post.all
  	end


  end

  def signup
  end
end
