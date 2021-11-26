class FavoritesController < ApplicationController
  def create
    idea = Idea.find(params[:idea_id])
    favorite = current_user.favorites.new(idea_id: idea.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    idea = Idea.find(params[:idea_id])
    favorite = current_user.favorites.find_by(idea_id: idea.id)
    favorite.destroy
    redirect_to request.referer
  end
end
