class Api::V1::UsersController < ApplicationController
  def create
    @user = Scim::UserCreator.new(params).create

    if @user.save
      respond_with @user, status: :created
    else
      respond_with @user, :status => :unprocessable_entity
    end
  end

  def index
    respond_with @user = User.all
  end

  def show
    respond_with @user = User.find(params[:id])
  end

  private
  def show_failure
    respond_with  @user.errors.full_messages, :status => :unprocessable_entity
  end
end
