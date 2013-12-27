class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @users = User.search(params[:search]).order(sort_column + " " + sort_direction)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    render :new unless @user.save
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    render :edit unless @user.update_attributes(params[:user])
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end

  private

  def sort_column
  	params[:sort] || "first_name"
  end

  def sort_direction
  	params[:direction] || "asc"
  end

end
