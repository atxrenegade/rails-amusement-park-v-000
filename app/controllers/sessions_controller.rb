class SessionsController < ApplicationController
	def new
		render :new
	end

	def create
		@user = User.find_by(id: params[:user][:user_id])
		if @user && @user.authenticate(params[:user][:password])
				session[:user_id] = @user[:id]
				redirect_to '/users/:id'
		else
			render :new
		end
	end

	def destroy
		session.delete :username
	end
end
