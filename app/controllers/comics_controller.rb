class ComicsController < ApplicationController
  def index
    @offset = params.fetch(:offset, 0).to_i
    @offset = 0 if @offset <= 0
    if params.has_key?(:search) && params.fetch(:search).present?
      @comics = Comic.get_comics_by_character(params.fetch(:search), @offset)
    else
      @comics = Comic.get_comics(@offset)
    end
    @comics
  end

  def by_character
    @offset = params.fetch(:offset, 0).to_i
    @offset = 0 if @offset <= 0
  end
end
