class UsersWorker
	include Sidekiq::Worker
	# sidekiq_options retry: false

	def perform email
    UserMailer.signup_confirmation(@user).deliver_now	
	end
end

# app directory

# bundle exec sidekiq --environment development -C config/sidekiq.yml

# redis-server # root directory

# rails s as we know