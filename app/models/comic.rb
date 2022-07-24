class Comic < ApplicationRecord
  require 'digest/md5'
  require 'rest-client'

  def self.get_comics
    parsed_data = JSON.parse(call_api)
    parsed_data['data']['results'].map { |results| {"id" => results["id"], "title" => results["title"], "image" => results["thumbnail"]["path"]} }
  end

  private

  def self.call_api
    RestClient.get("#{Rails.application.secrets.url}#{Rails.application.credentials[:MARVEL_API][:PUBLIC_KEY]}&hash=#{Digest::MD5.hexdigest(Rails.application.credentials[:MARVEL_API][:HASH])}&ts=1234&orderBy=-onsaleDate")
  end
end
