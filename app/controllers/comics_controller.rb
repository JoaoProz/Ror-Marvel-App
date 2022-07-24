class ComicsController < ApplicationController
  def index
    @offset = params.fetch(:offset, 0).to_i
    @offset = 0 if @offset <= 0
    @comics = Comic.get_comics(@offset)
    @comics
  end
end
