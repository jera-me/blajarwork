class StoriesController < ApplicationController
  def index
    @stories = Story.all
    @speaker = Speaker.all
  end

  def all
    @stories = Story.all
  end
end
