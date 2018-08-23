require 'sinatra/base'
require 'sinatra/namespace'
require 'sinatra/json'
require './lib/dht/sensor'

class Application < Sinatra::Base
  register Sinatra::Namespace
  register Sinatra::JSON

  namespace '/api' do
    get '/dht' do
      json temp_humidity
    end
  end

  not_found do
    error 400 do
      'Not Found'
    end
  end

  def temp_humidity
    { temperature: DHT::Sensor.temperature_value.floor(1), humidity: DHT::Sensor.humidity_value.floor(1) }
  end
end
