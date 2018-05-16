class StoriesController < ApplicationController
  def index
    @stories = Story.order(created_at: :desc).limit(9)
    @speaker = Speaker.all
  end

  def all
    @stories = Story.order(created_at: :desc)
    @speaker = Speaker.all
  end

  def show
    @stories = Story.friendly.find(params[:id])
    @speaker = @stories.speaker
  end

  def new
    @stories = Story.new
  end

  def create
    @stories = Story.new(resource_params)
    @stories.speaker = Speaker.first
    @stories.save
  end

  def edit
    @stories = Story.friendly.find(params[:id])
  end

  def update
    @stories = Story.friendly.find(params[:id])
    @stories.update(resource_params)
    redirect_to content_all_path
  end

  def destroy
    @stories = Story.friendly.find(params[:id])
    @stories.destroy
    redirect_to content_all_path
  end

  private

  def resource_params
    params.require(:story).permit(:title, :content, :quote, :image, :video, :date, :status, :speaker)
  end

end
