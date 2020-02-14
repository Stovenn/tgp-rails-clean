class GossipController < ApplicationController
  def show
    @gossip =  Gossip.find(params[:id])
    @c_id = @gossip.user.city.id
    @u_id = @gossip.user.id
    @comments = Gossip.find(params[:id]).comments
    @comment = @gossip.comments.new
  end

  before_action :authenticate_user, only: [:index]
  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.create(title: params[:title], content: params[:content])
    @gossip.user = User.find_by(id: session[:user_id])
    if @gossip.save # essaie de sauvegarder en base @gossip
      flash[:success] = "Potin bien créé !"
      redirect_to root_index_path
    else
    # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      render 'new'
    end
  end

  def edit
    @gossip = Gossip.find(params[:id]) 
  end

  def update
    @gossip = Gossip.find(params[:id]) 

    if @gossip.update(title: params[:title], content: params[:content]) # essaie de sauvegarder en base @gossip
      redirect_to gossip_path
    else
      flash[:danger] = "Une erreur est survenue."
      render 'edit'
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id]) 

    if @gossip.destroy
      redirect_to root_index_path
    else
      render 'gossip'
    end
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end
