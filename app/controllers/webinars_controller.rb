class WebinarsController < ApplicationController
  def index
    @webinars = Webinar.order(date: :asc).paginate(per_page: 9, page: params[:page])
    @speaker = Speaker.all

    @meta_title = meta_title 'Upcoming Webinars'

  end

  def all
    @webinars = Webinar.order(created_at: :desc).paginate(per_page: 9, page: params[:page])
    authorize @webinars
  end

  def show
    @webinars = Webinar.friendly.find(params[:id])
    @speaker = @webinars.speaker
    @meta_title = meta_title @webinars.title
    @meta_description = @webinars.content.gsub('“','')
    @meta_keyword = @webinars.slug.gsub('-', ',')
    @canonical_url = "https://zynau.com/webinars/#{@webinars.slug}"
    @og_properties = {
      title: @meta_title,
      type:  'website',
      image: view_context.image_url(@webinars.image),  # this file should exist in /app/assets/images/logo.png
      url: @canonical_url
      }
  end

  def new
      @webinars = Webinar.new
      @speaker = Speaker.all
      authorize @webinars
  end

  def create
    @webinars = Webinar.new(resource_params)
    @webinars.save
    redirect_to admin_webinar_all_path
  end

  def edit
      @webinars = Webinar.friendly.find(params[:id])
      @speaker = Speaker.all
      authorize @webinars

  end

  def update
    @webinars = Webinar.friendly.find(params[:id])
    @webinars.update(resource_params)
    authorize @webinars
    redirect_to admin_webinar_all_path
  end

  def destroy
    @webinars = Webinar.friendly.find(params[:id])
    @webinars.destroy
    authorize @webinars
    redirect_to admin_webinar_all_path
  end

  private

  def resource_params
    params.require(:webinar).permit(:title, :content, :date, :enddate, :video, :image, :link, :speaker_id)
  end

end
