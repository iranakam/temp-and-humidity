require 'dht-sensor-ffi'

module DHT
  class Sensor
    class << self
      def values
        DhtSensor.read(ENV['SENSOR_PIN'].to_i, ENV['SENSOR_TYPE'].to_i)
      end

      def temperature_value
        values.temp
      end

      def humidity_value
        values.humidity
      end
    end
  end
end
