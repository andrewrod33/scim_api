class UsersController < ApplicationController
  def create
    build_user = ::Scim::ScimTypeBuilder.new(params).build_type
    @user = build_user.create

    if @user.save
      render json: ScimPresenter.new(@user), status: :created
    else
      respond_with @user, :status => :unprocessable_entity
    end

  end

  def index
    scim_users = User.all.collect do | user |
      ScimPresenter.new(user)
    end
    respond_with scim_users
  end

  def show
    respond_with ScimPresenter.new(User.find(params[:id]))
  end

  private
  def show_failure
    respond_with  @user.errors.full_messages, :status => :unprocessable_entity
  end
end
