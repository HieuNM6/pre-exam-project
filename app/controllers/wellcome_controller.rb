class WellcomeController < ApplicationController
  def index
  	@posts = Post.all
  end

  def signup
  end
end
