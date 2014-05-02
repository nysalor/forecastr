module Forecastr
  class City
    attr_reader :name, :latitude, :longitude

    def initialize(data)
      @data = data
      @name = @data.city
      @latitude = @data.latitude
      @longitude = @data.longitude
    end

    def current_forecast
      Forecastr::Forecast.new(@data)
    end

    def ten_days_forecast
      data = Forecastr::Client.ten_days(@latitude, @longitude)
      data.list.collect do |item|
        Forecastr::Forecast.new(item)
      end
    end

  end
end
