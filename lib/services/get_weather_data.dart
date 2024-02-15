
import 'package:cuaca_simple/services/networking.dart';
import 'location.dart';

class GetWeatherData {
  bool isFromSearch;
  String? city;
  GetWeatherData(this.isFromSearch,[this.city]);
  String apiKey = 'e20726ec89604f2f9a7b01b6afa3d39d';
  String openWeatherUrl = 'https://api.weatherbit.io/v2.0/forecast/daily';

  getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    String? cityName=isFromSearch?city:location.cityName;
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherUrl?city=$cityName&key=$apiKey&days=7' as Uri);
    return await networkHelper.getData();
  }
}