require 'spec_helper'

describe Forecastr::Radar do
  let(:radar) { Forecastr::Radar.new }

  it 'finds city' do
    stub_get("http://api.openweathermap.org/data/2.5/weather?q=London,UK").to_return(:body => fixture('london.json'), :headers => {:content_type => 'application/json; charset=utf-8'})

    city = radar.find_by_name("London,UK")

    expect(city.name).to eq "London"
    expect(city.longitude).to eq -0.13
    expect(city.latitude).to eq 51.51
  end


  it 'finds forecast by coordinates' do
    stub_get("http://api.openweathermap.org/data/2.5/weather?lat=42.0&lon=21.4333").to_return(:body => fixture('skopje.json'), :headers => {:content_type => 'application/json; charset=utf-8'})

    city = radar.find_by_coordinates(42.000, 21.4333)

    expect(city.name).to eq "Opština Karpoš"
    expect(city.longitude).to eq 21.43
    expect(city.latitude).to eq 42
  end

end
