require 'spec_helper'

describe Forecastr::City do
  let(:json) { JSON.parse(fixture('skopje.json').read) }
  let(:container) { Forecastr::DataContainer.new(json) }
  let(:city) { Forecastr::City.new(container) }

  it '#name' do
    expect(city.name).to eq "Opština Karpoš"
  end

  it '#latitude' do
    expect(city.latitude).to eq 42
  end

  it '#longitude' do
    expect(city.longitude).to eq 21.43
  end

  describe '#current_forecast' do
    it 'returns a Forecast object' do
      expect(city.current_forecast.class).to eq Forecastr::Forecast
    end

    it 'has different properties' do
      expect(city.current_forecast.temperature.to_celsius).to eq 10.7
      expect(city.current_forecast.min_temperature.to_celsius).to eq 7.0
      expect(city.current_forecast.max_temperature.to_celsius).to eq 12.78
      expect(city.current_forecast.humidity).to eq 70
      expect(city.current_forecast.pressure).to eq 1021
    end
  end

  describe '#ten_days_forecast' do

    it 'returns an array of Forecast objects' do
      stub_get("http://api.openweathermap.org/data/2.5/forecast/daily?cnt=10&lat=42&lon=21.43&mode=json").to_return(:body => fixture('skopje_10_days.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
      expect(city.ten_days_forecast.class).to eq Array
      expect(city.ten_days_forecast.first.class).to eq Forecastr::Forecast
    end

  end
end
