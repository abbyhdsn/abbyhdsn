class AdminController < ApplicationController
  before_action :is_admin!
  def dash
  	@posts = Post.all
  	@users = User.all
  end
end
