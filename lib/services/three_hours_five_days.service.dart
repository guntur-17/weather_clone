import 'package:dio/dio.dart';
import 'package:openweather_app/models/threehours_fivedays/threehours_fivedays.dart';

class ThreeHFiveDServices {
  static Future<ThreehoursFivedaysModel?> getThreeHFiveD(
      {double? lat, double? long}) async {
    ThreehoursFivedaysModel? datas;
    try {
      var response = await Dio().get(
          'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$long&appid=40d1905d9727df12f102fb54da3791c4');
      print(response.statusCode);
      if (response.statusCode == 200) {
        datas = ThreehoursFivedaysModel.fromJson(response.data);
        print(datas.city?.name);
        return datas;
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
    return null;
  }
}
