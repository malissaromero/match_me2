class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params)
  end

  def get_from_api
    response = HTTParty.get('')
    puts response.body, response.code, response.message, response.headers.inspect
  end

  private
  def user_params
    params.require(:user).permit(:name, :photo_url)
  end
end
