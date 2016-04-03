class UsersController < ApplicationController
	def profile
		@user = User.find(current_user.id)
	end

	def edit_profile
		@user = User.find(current_user.id)		
	end

	def update_profile
    @user = User.find(current_user.id)
    if @user.update_attributes(user_params)
      redirect_to profile_path
    else
      render 'edit_profile'
    end
	end

	private

	# Use strong_parameters for attribute whitelisting
	# Be sure to update your create() and update() controller methods.

	def user_params
	  params.require(:user).permit(:email, :nick_name, :profile_pic)
	end
end
