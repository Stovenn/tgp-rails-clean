class UserController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(last_name: params[:last_name], first_name: params[:first_name], age: params[:age], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], city: City.last) # avec xxx qui sont les données obtenues à partir du formulaire

    if @user.save # essaie de sauvegarder en base @gossip
      redirect_to root_index_path
    else
    # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @id = @user.city.id
  end

end
