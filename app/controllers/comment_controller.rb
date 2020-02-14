class CommentController < ApplicationController

  def create
    @gossip = Gossip.find(params[:id])
    @comment = Comment.new(content:params[:content], user_id = User.all.sample.id, :gossip_id: @gossip.id)

    if @comment.save
      redirect_to @gossip
    else
      render 'gossip/show'
    end
  end
end
