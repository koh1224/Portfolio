class IdeasController < ApplicationController
  def twitter_client
    return client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end
  end

  def index
    client = twitter_client
    #@tweets = client.home_timeline.first(2)
    @trends = client.trends(id = 23424856).first(10)
    @idea = Idea.new
    @ideas = Idea.all
    @user = current_user
  end

  def show
    @idea = Idea.new
    @ideafind = Idea.find(params[:id])
    @user = @ideafind.user

  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user_id = current_user.id
    if @idea.save
      tags = Vision.get_image_data(@idea.image)
      tags.each do |tag|
        @idea.tags.create(name: tag)
      end
      redirect_to ideas_path, notice: "You have created idea successfully."
    else
      render :new
    end
  end

  def edit
    @idea = Idea.find(params[:id])
    if @idea.user == current_user
      render "edit"
    else
      redirect_to ideas_path
    end
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
    redirect_to idea_path(@idea), notice: "You have updated idea successfully."
    else
      render "edit"
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to ideas_path, notice: "idea was successfully destroyed."
  end

  private

  def idea_params
    params.require(:idea).permit(:idea, :body, :image, :url)
  end

end
