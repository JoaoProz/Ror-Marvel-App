class ComicsController < ApplicationController
  def index
    @comics = Comic.get_comics
    @comics
  end
end
