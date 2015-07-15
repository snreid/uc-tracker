module USDA
  require 'uri'
  require 'net/http'
  require 'json'

  class API
    attr_accessor :base_uri

    API_KEY = { api_key: Rails.application.secrets.usda_api_key }

    def initialize(base_uri = "http://api.nal.usda.gov/ndb")
      @base_uri = base_uri
    end

    def response(endpoint, params = {})
      uri = build_uri(endpoint, params)
      response = Net::HTTP.get(uri)
      JSON.parse(response)
    end

    def build_uri(endpoint, params)
      params.merge!(API_KEY)
      uri = URI(@base_uri + endpoint)
      uri.query = URI.encode_www_form(params)
      uri
    end
  end
end