class Public::UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end
	def edit
		@user = User.find(params[:id])
		if @user == current_user
		    render :edit
		else
			redirect_to user_path(current_user.id)
		end
	end
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "変更を保存しました"
			redirect_to user_path(@user.id)
		else
			render :edit
		end
	end
	def unsubscribe
	end
	def withdraw
	end
	def index
	end
	private
	def user_params
      params.require(:user).permit(:username, :nickname, :email, :is_deleted, :image, :profiel)
    end
end
