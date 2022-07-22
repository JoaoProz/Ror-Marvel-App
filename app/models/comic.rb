class Comic < ApplicationRecord
    include HTTParty
    base_uri = 'https://gateway.marvel.com:443/v1/public/comics/1?apikey='

    def initialize
    end

    def get_comics()
        call_api
    end

    private

    def call_api
        response = HTTParty.get("#{base_uri}07e3e205bebd46de31d15ee9a76d85c2")
    end
end
