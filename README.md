Airport Test
============

Week 3 test @ Makers Academy

This is an imagined software for an airport. Planes can land and take off provided there is enough capacity and the weather condions are good.

Airport can be created with a specific weather and capacity. Eg.

```
Airport.new( { :weather => fine_weather, :capacity => 6 } )
```

If weather is not defined it will be generated randomly. Default capacity is set at 20.

Weather does not take any arguments. You can get new weather by calling generate_weather method. Like so:

```
weather = Weather.new
weather.generate_weather
```

Weather can also be generated from within the airport:

```
airport = Airport.new
airport.get_weather
```

