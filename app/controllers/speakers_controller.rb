class SpeakersController < ApplicationController
  def index
    @speakers = Speaker.order(created_at: :desc).paginate(per_page: 9, page: params[:page])
    @meta_title = meta_title 'Our Speakers'
  end

  def all
    @speakers = Speaker.order(created_at: :desc).paginate(per_page: 9, page: params[:page])
    authorize @speakers
  end

  def show
    @speakers = Speaker.friendly.find(params[:id])
    #@stories = @stories.speaker
    @meta_title = meta_title @speakers.name
    @meta_description = @speakers.content.gsub('“','').gsub('<p>','')

    @root_path = root_path
    @canonical_url = "https://zynau.com/stories/#{@speakers.slug}"
    @og_properties = {
      title: @meta_title,
      type:  'website',
      image: view_context.image_url(@speakers.image),  # this file should exist in /app/assets/images/logo.png
      url: @canonical_url
      }
  end

  def new
      @speakers = Speaker.new
      authorize @speakers
  end

  def create
    @speakers = Speaker.new(resource_params)
    @speakers.save
    redirect_to admin_speaker_all_path
  end

  def edit
      @speakers = Speaker.friendly.find(params[:id])
      authorize @speakers

  end

  def update
    @speakers = Speaker.friendly.find(params[:id])
    @speakers.update(resource_params)
    authorize @speakers
    redirect_to admin_speaker_all_path
  end

  def destroy
    @speakers = Speaker.friendly.find(params[:id])
    @speakers.destroy
    authorize @speakers
    redirect_to admin_speaker_all_path
  end

  private

  def resource_params
    params.require(:speaker).permit(:name, :username, :job, :category, :link_cv, :content, :facebook, :twitter, :instagram, :linkedin, :email, :website, :image)
  end


end
