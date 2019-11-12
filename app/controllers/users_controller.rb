class UsersController < ApplicationController
before_action :correct_user, only: [:edit, :update]
	def index
		@users = User.all
  	@book = Book.new
	end
  def show
  	@user = User.find(params[:id])
		@books = @user.books
  	@book = Book.new
  end
  def edit
  	@user = User.find(params[:id])
  end
  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
      flash[:notice] = "User was successfully updated."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to users_path
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end
  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end
  end

end
