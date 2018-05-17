class StoriesController < ApplicationController
  def index
    @stories = Story.order(created_at: :desc).limit(9)

    @speaker = Speaker.all

  end

  def all
    if user_signed_in?
      @stories = Story.order(created_at: :desc)
      @speaker = Speaker.all
    else
      redirect_to root_path
    end
  end

  def show
    @stories = Story.friendly.find(params[:id])
    @speaker = @stories.speaker
  end

  def new
    if user_signed_in?
      @stories = Story.new
      @speaker = Speaker.all
    else
      redirect_to root_path
    end
  end

  def create
    @stories = Story.new(resource_params)
    @stories.save
    redirect_to admin_stories_all_path
  end

  def edit
    if user_signed_in?
      @stories = Story.friendly.find(params[:id])
      @speaker = Speaker.all
    else
      redirect_to root_path
    end
  end

  def update
    @stories = Story.friendly.find(params[:id])
    @stories.update(resource_params)
    redirect_to admin_stories_all_path
  end

  def destroy
    @stories = Story.friendly.find(params[:id])
    @stories.destroy
    redirect_to admin_stories_all_path
  end

  private

  def resource_params
    params.require(:story).permit(:title, :content, :quote, :image, :video, :date, :status, :speaker_id)
  end

end
