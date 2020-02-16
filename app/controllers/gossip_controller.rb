class GossipController < ApplicationController
  before_action :authenticate_user

  def show
    @gossip =  Gossip.find(params[:id])
    @c_id = @gossip.user.city.id
    @u_id = @gossip.user.id
    @comments = Gossip.find(params[:id]).comments
    @comment =  Comment.new
  end
  
  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.create(title: params[:title], content: params[:content])
    @gossip.user = User.find_by(id: session[:user_id])
    if @gossip.save
      flash[:success] = "Potin bien créé !"
      redirect_to root_path
    else
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
