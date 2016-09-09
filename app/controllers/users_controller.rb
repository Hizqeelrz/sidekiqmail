class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
  		# Send email
      UserMailer.signup_confirmation(@user).deliver_now
  		redirect_to @user, notice: "Signed up Successfully."
  	else
  		render :new
  	end
  end

  def show
  	@user = User.find(params[:id])
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email)
  end
end
