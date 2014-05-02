require 'date'

module Forecastr
  class Forecast

    attr_reader :temperature, :pressure, :humidity, :min_temperature,
                :max_temperature, :clouds, :wind, :sunrise, :sunset

    def initialize(data)
      @temperature = Forecastr::Temperature.new(data.temperature)
      @pressure = data.pressure
      @humidity = data.humidity
      @min_temperature = Forecastr::Temperature.new(data.min_temperature)
      @max_temperature = Forecastr::Temperature.new(data.max_temperature)
      @clouds = data.clouds
      @wind = Forecastr::Wind.new(data.wind_speed, data.wind_angle)
      @sunset = DateTime.strptime(data.sunset, '%s')
      @sunrise = DateTime.strptime(data.sunrise, '%s')
    end

  end
end
