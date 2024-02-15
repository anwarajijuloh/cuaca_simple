import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class WeatherModel {
  String cityName;
  String temp;
  String mainCondition;
  String maxTemp, minTemp;
  String windSpeed;
  String humidity;
  String pressure;
  int condition;
  String country;
  String pop;
  String icon;
  List daysForecast;
  int ts;

  WeatherModel(
      {required this.cityName,
      required this.temp,
      required this.mainCondition,
      required this.maxTemp,
      required this.minTemp,
      required this.windSpeed,
      required this.pressure,
      required this.condition,
      required this.country,
      required this.ts,
      required this.pop,
      required this.icon,
      required this.daysForecast,
      required this.humidity});

  WeatherModel.fromJson(Map<String, dynamic> parsedWeatherData)
      : cityName = parsedWeatherData['city_name'],
        ts = parsedWeatherData['data'][0]['ts'],
        temp = (parsedWeatherData['data'][0]['temp']).toStringAsFixed(0),
        maxTemp = (parsedWeatherData['data'][0]['max_temp']).toStringAsFixed(0),
        minTemp = (parsedWeatherData['data'][0]['low_temp']).toStringAsFixed(0),
        icon = parsedWeatherData['data'][0]['weather']['icon'],
        mainCondition = parsedWeatherData['data'][0]['weather']['description'],
        windSpeed =
            (parsedWeatherData['data'][0]['wind_spd']).toStringAsFixed(1),
        humidity = (parsedWeatherData['data'][0]['rh']).toString(),
        condition = parsedWeatherData['data'][0]['weather']['code'],
        country = parsedWeatherData['country_code'],
        pop = parsedWeatherData['data'][0]['pop'].toString(),
        daysForecast = parsedWeatherData['data'],
        pressure = (parsedWeatherData['data'][0]['pres'] * 0.000986923)
            .toStringAsFixed(0);

  Image getWeatherIcon(String icon) {
    return Image.network(
        'https://www.weatherbit.io/static/img/icons/$icon.png');
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s icecream time';
    } else if (temp > 20) {
      return 'Time for shorts and t-shirts';
    } else if (temp < 10) {
      return 'You\'ll need muffler and gloves';
    } else {
      return 'Bring a coat just in case';
    }
  }

  String getFormattedDate() {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(ts * 1000);
    var formatter = new DateFormat('yMMMMEEEEd');
    String formatted = formatter.format(dateTime);
    return formatted;
  }
}

/* 
{  
               "data":[  
                  {  
                     "wind_cdir":"NE",
                     "rh":59,
                     "pod":"d",
                     "lon":-78.63861,
                     "pres":1006.6,
                     "timezone":"America\/New_York",
                     "ob_time":"2017-08-28 16:45",
                     "country_code":"US",
                     "clouds":75,
                     "vis":10,
                     "wind_spd":6.17,
                     "gust": 8,
                     "wind_cdir_full":"northeast",
                     "app_temp":24.25,
                     "state_code":"NC",
                     "ts":1503936000,
                     "h_angle":0,
                     "dewpt":15.65,
                     "weather":{  
                        "icon":"c03d",
                        "code": 803,
                        "description":"Broken clouds"
                     },
                     "uv":2,
                     "aqi":45,
                     "station":"CMVN7",
                     "sources": ["rtma", "CMVN7"],
                     "wind_dir":50,
                     "elev_angle":63,
                     "datetime":"2017-08-28:17",
                     "precip":0,
                     "ghi":444.4,
                     "dni":500,
                     "dhi":120,
                     "solar_rad":350,
                     "city_name":"Raleigh",
                     "sunrise":"10:44",
                     "sunset":"23:47",
                     "temp":24.19,
                     "lat":35.7721,
                     "slp":1022.2
                  }
               ],
               "minutely":[ ... ],
               "count":1
            }
 */
