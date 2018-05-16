class StoriesController < ApplicationController
  def index
    @stories = Story.all
    @speaker = Speaker.all
  end
end
