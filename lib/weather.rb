module WeatherModule
  
  def generate_weather
    @storm ||= rand(2) == 1
  end

  def stormy?
    @storm
  end

  def de_storm
    @storm = false
  end

end

class Weather
  include WeatherModule
end