class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      respond_with @user
    else
      show_failure
    end
  end

  def index
    respond_with User.all
  end

  def show
    respond_with User.find(params[:id])
  end

  private
  def show_failure
    respond_with @user, :status => :unprocessable_entity
  end

  def user_params
    params[:user].permit(:first_name, :last_name, :username, :account_id)
  end
end
