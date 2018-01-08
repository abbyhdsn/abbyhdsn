class AdminController < ApplicationController
  before_action :is_admin!
  def dash
  end
end
