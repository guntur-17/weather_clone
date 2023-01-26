import 'package:openweather_app/models/threehours_fivedays/threehours_fivedays.dart';
import 'package:openweather_app/services/three_hours_five_days.service.dart';

class ThreeHFiveDRepository {
  Future<ThreehoursFivedaysModel?> getThreeHFiveDWeather(
      {required double lat, required double long}) async {
    return ThreeHFiveDServices.getThreeHFiveD(lat: lat, long: long);
  }
}

class NetworkError extends Error {}
