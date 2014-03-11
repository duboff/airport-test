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

## comments
You land the plane after you add it to your list of planes. What would happen if the plane crashed before it landed. Also you could potentially ask the plane to take off before it has landed.

Having the weather class just include the weather module seems strange.

Seperate your tests into different contexts. Think about it like a scenario, the weather is stormy or the weather is fine.

The plane is flying when you create it, is it spawned in mid air?!
It's stormy half of the time.
No tests for weather, just about acceptable because of the speration of weather as an injected colabortator.

# PASS
