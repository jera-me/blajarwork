class StoriesController < ApplicationController
  def index
    @stories = Story.order(created_at: :desc).limit(9)
    @speaker = Speaker.all

  end

  def all
    @stories = Story.order(created_at: :desc)
    authorize @stories
  end

  def show
    @stories = Story.friendly.find(params[:id])
    @speaker = @stories.speaker
  end

  def new
      @stories = Story.new
      @speaker = Speaker.all
      authorize @stories
  end

  def create
    @stories = Story.new(resource_params)
    @stories.save
    redirect_to admin_stories_all_path
  end

  def edit
      @stories = Story.friendly.find(params[:id])
      @speaker = Speaker.all
      authorize @stories
      
  end

  def update
    @stories = Story.friendly.find(params[:id])
    @stories.update(resource_params)
    authorize @stories
    redirect_to admin_stories_all_path
  end

  def destroy
    @stories = Story.friendly.find(params[:id])
    @stories.destroy
    authorize @stories
    redirect_to admin_stories_all_path
  end

  private

  def resource_params
    params.require(:story).permit(:title, :content, :quote, :image, :video, :date, :status, :speaker_id)
  end

end
