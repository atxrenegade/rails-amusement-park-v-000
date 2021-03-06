class User < ActiveRecord::Base
	has_secure_password

	has_many :rides
	has_many :attractions, through: :rides

	#validates :password,
	#	presence: true

	def mood
		self.nausea < self.happiness ? mood = "happy" : mood = "sad"
	end
end
