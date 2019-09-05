class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	helper_method :current_user, :logged_in?

	def welcome
	end

	helpers

		def logged_in?
			current_user != nil
		end

		def current_user
			@current_user ||= User.find_by(id: session[:user_id])
		end
end
