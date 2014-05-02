require "net/http"
require 'json'

module Forecastr
  class Client
    API_URL = "http://api.openweathermap.org/data/2.5/"

    class << self
      def search_by_city(city_name)
        uri = URI(API_URL + "weather?q=" + city_name)
        json = JSON.parse(Net::HTTP.get(uri))
        Forecastr::DataContainer.new(json)
      end

      def search_by_coordinates(lat, lon)
        uri = URI(API_URL + "weather?lat=#{lat}&lon=#{lon}")
        json = JSON.parse(Net::HTTP.get(uri))
        Forecastr::DataContainer.new(json)
      end

      def ten_days(lat, lon)
        uri = URI(API_URL + "forecast/daily?lat=#{lat}&lon=#{lon}&cnt=10&mode=json")
        json = JSON.parse(Net::HTTP.get(uri))
        Forecastr::DataContainer.new(json)
      end
    end

  end
end
