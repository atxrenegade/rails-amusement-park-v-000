class Ride < ActiveRecord::Base
	belongs_to :attraction
	belongs_to :user

	def take_ride
		if (user.tickets - attraction.tickets) < 0 && (user.height - attraction.min_height) < 0
			return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
		elsif (user.tickets - attraction.tickets) < 0
			return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
		elsif (user.height - attraction.min_height) <= 0
			return "Sorry. You are not tall enough to ride the #{attraction.name}."
		else
			tickets = user.tickets - attraction.tickets
			nausea = user.nausea + attraction.nausea_rating
			happiness = user.happiness + attraction.happiness_rating
			user_params = {:tickets => tickets, :nausea => nausea, :happiness => happiness}
			user.update(user_params)
		end
	end
end
