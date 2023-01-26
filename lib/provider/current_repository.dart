import 'package:openweather_app/models/current/current.dart';
import 'package:openweather_app/services/current.service.dart';

class CurrentRepository {
  Future<CurrentModel?> getCurrentWeather({double? lat, double? long}) async {
    return CurrentServices.getCurrent(lat: lat, long: long);
  }
}

class NetworkError extends Error {}
