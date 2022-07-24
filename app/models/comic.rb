class Comic < ApplicationRecord
  require 'digest/md5'
  require 'rest-client'

  def self.get_comics offset
    parsed_data = JSON.parse(call_api_fetch_comics(offset))
    parsed_data['data']['results'].map { |results| {"id" => results["id"], "title" => results["title"], "image" => image(results)} }
  end
  
  def self.get_comics_by_character(name, offset)
    character_id = JSON.parse(call_api_fetch_character(name))['data']['results'][0]['id']
    parsed_data = JSON.parse(call_api_fetch_comics_by_character(offset, character_id))
    parsed_data['data']['results'].map { |results| {"id" => results["id"], "title" => results["title"], "image" => image(results)} }
  end

  private

  def self.call_api_fetch_comics offset
    RestClient.get("#{Rails.application.secrets.url}comics?apikey=#{Rails.application.credentials[:MARVEL_API][:PUBLIC_KEY]}&hash=#{Digest::MD5.hexdigest(Rails.application.credentials[:MARVEL_API][:HASH])}&ts=1234&orderBy=-onsaleDate&offset=#{offset}")
  end

  def self.call_api_fetch_character name
    RestClient.get("#{Rails.application.secrets.url}characters?apikey=#{Rails.application.credentials[:MARVEL_API][:PUBLIC_KEY]}&hash=#{Digest::MD5.hexdigest(Rails.application.credentials[:MARVEL_API][:HASH])}&ts=1234&name=#{name}")
  end

  def self.call_api_fetch_comics_by_character(offset, id_character)
    RestClient.get("#{Rails.application.secrets.url}comics?apikey=#{Rails.application.credentials[:MARVEL_API][:PUBLIC_KEY]}&hash=#{Digest::MD5.hexdigest(Rails.application.credentials[:MARVEL_API][:HASH])}&ts=1234&orderBy=-onsaleDate&offset=#{offset}&characters=#{id_character}")
  end


  def self.image results
    "#{results["thumbnail"]["path"]}/portrait_uncanny.#{results["thumbnail"]["extension"]}"
  end
end
