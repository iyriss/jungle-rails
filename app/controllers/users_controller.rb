class UsersController < ApplicationController
  def new
  end

  def create
    puts "creating new user here!"
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/', notice: 'Account created successfully'
    else
      flash[:error] = 'An error occured!'
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end