class PodcastsController < ApplicationController
  def show
    @podcast = Podcast.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @podcast = Podcast.new
  end

  def edit
    @podcast = Podcast.find(params[:id])
  end
end
