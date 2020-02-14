class RootController < ApplicationController
  def index
  	@gossips = Gossip.all
  	puts "@" * 60
  	@first_name = params[:first_name]
  	puts "@" * 60
  end
end
