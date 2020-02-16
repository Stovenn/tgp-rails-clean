class UserController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.city_id = City.all.sample.id

    puts "$" * 60
    puts @user.last_name
    puts @user.first_name
    puts @user.age
    puts @user.email
    puts @user.city_id
    puts "$" * 60


    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @id = @user.city.id
  end

  private

  def user_params
     params.require(:user).permit(:last_name, :first_name, :age, :email, :password, :password_confirmation)
  end

end
