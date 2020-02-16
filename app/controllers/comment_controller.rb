class CommentController < ApplicationController

  def create
    @gossip = Gossip.find(params[:gossip_id])
    @c_id = @gossip.user.city.id
    @u_id = @gossip.user.id
    @comments = Comment.all
    @comment = Comment.new(content:params[:content], user_id: current_user, gossip_id: @gossip)

    if @comment.save
      redirect_to gossip_path
    else
      render 'gossip/show'
    end
  end
end
