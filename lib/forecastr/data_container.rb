module Forecastr
  class DataContainer

    attr_reader :city, :longitude, :latitude, :pressure, :humidity, :clouds, :list,
      :temperature, :min_temperature, :max_temperature, :wind_speed, :wind_angle, :sunrise, :sunset

    def initialize(json)
      if json.has_key?('list')
        @city = json['city']['name']
        @longitude = json['city']['coord']['lon']
        @latitude = json['city']['coord']['lat']

        @list = json['list'].collect do |forecast|
          @pressure = forecast['pressure']
          @humidity = forecast['humidity']
          @clouds = forecast['clouds']
          @wind_speed = forecast['speed']
          @wind_angle = forecast['deg']
          @rain = forecast['rain']


          @day_temperature = forecast['temp']['day']
          @max_temperature = forecast['temp']['max']
          @min_temperature = forecast['temp']['min']
          @night_temperature = forecast['temp']['night']
          @eve_temperature = forecast['temp']['eve']
          @morning_temperature = forecast['temp']['morn']
        end
      else
        @city = json['name']
        @longitude = json['coord']['lon']
        @latitude = json['coord']['lat']
        @temperature = json['main']['temp']
        @pressure = json['main']['pressure']
        @humidity = json['main']['humidity']
        @min_temperature = json['main']['temp_min']
        @max_temperature = json['main']['temp_max']
        @clouds = json['clouds']['all']
        @wind_speed = json['wind']['speed']
        @wind_angle = json['wind']['deg']
        @sunrise = json['sys']['sunrise'].to_s
        @sunset = json['sys']['sunset'].to_s
      end
    end
  end
end
