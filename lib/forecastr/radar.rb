require "net/http"
require 'json'

module Forecastr
  class Radar
    class << self
      def find_by_name(city_name)
        new.find_by_name(city_name)
      end

      def find_by_coordinates(lat, lon)
        new.find_by_coordinates(lat, lon)
      end
    end

    def find_by_name(name)
      data = Forecastr::Client.search_by_city(name)
      Forecastr::City.new(data)
    end

    def find_by_coordinates(lat, lon)
      data = Forecastr::Client.search_by_coordinates(lat, lon)
      Forecastr::City.new(data)
    end

  end
end
