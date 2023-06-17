class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
  end

  def update
  end
end
