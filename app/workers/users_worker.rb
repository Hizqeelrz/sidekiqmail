class UsersWorker
	include Sidekiq::Worker
	# sidekiq_options retry: false

	def perform email
    UserMailer.signup_confirmation(@user).deliver_now	
	end
end