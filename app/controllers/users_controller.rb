class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_filter :get_users, only: [:index, :sort, :destroy]
  before_filter :find_user, only: [:edit, :update, :destroy]
  skip_before_filter :require_login, only: [:index, :new, :create]

  def index; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def update
    render :edit unless @user.update_attributes(params[:user])
  end

  def destroy
    @user.destroy
  end

  def sort
    params[:user].each_with_index do |id, index|
      User.update_all({position: index+1}, {id: id})
    end
  end

  private

  def sort_column
    params[:sort].present? ? params[:sort] : "position"
  end

  def sort_direction
    params[:direction] || "asc"
  end

  def find_user
    @user = User.find(params[:id])
  end

  def get_users
    @users = User.order("#{sort_column} #{sort_direction}")
  end
end