class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]

    if favorite.save
      redirect_to topics_path, success: 'いいねしました。'
    else
      redirect_to topics_path, danger: 'いいねできませんでした。'
    end
  end
  
  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    if @favorite.destroy
      flash[:success] = "いいね解除しました"
      redirect_to "/topics/"
    end
  end
end