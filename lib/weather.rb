module WeatherModule
  
  def stormy?
    @stormy ||= rand(2) == 1
  end

  def generate_weather
    @stormy = rand(2) == 1
  end

end

class Weather
  include WeatherModule
end