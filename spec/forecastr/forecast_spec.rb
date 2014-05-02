require_relative '../spec_helper'

describe Forecastr::Forecast do
  let(:json) { JSON.parse(fixture('london.json').read) }
  let(:data) { Forecastr::DataContainer.new(json) }
  let(:forecast) { Forecastr::Forecast.new(data) }

  it 'has time of sunrise' do
    expect(forecast.sunrise).to eq DateTime.parse("2014-03-21T05:59:29+00:00")
  end

  it 'has time of sunset' do
    expect(forecast.sunset).to eq DateTime.parse("2014-03-21 19:15:36 +0100")
  end

  describe 'current forecast' do
    describe 'temperatures' do
      context 'celsius' do
        it 'has current temperature' do
          expect(forecast.temperature.to_celsius).to eq 7.64
        end

        it 'has minimal temperature' do
          expect(forecast.min_temperature.to_celsius).to eq 6.11
        end

        it 'has maximal temperature' do
          expect(forecast.max_temperature.to_celsius).to eq 9.0
        end
      end
    end

    it 'has pressure' do
      expect(forecast.pressure).to eq 1001
    end

    it 'has humidity' do
      expect(forecast.humidity).to eq 70
    end

  end

  describe 'clouds' do
    it 'has cloud coverage in %' do
      expect(forecast.clouds).to eq 92
    end
  end

  describe 'wind' do
    it 'has speed in m/s' do
      expect(forecast.wind.speed).to eq "5.1 m/s"
    end

    it 'has direction' do
      expect(forecast.wind.direction).to eq "S"
    end
  end
end
