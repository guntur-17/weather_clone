import 'package:dio/dio.dart';
import 'package:openweather_app/models/current/current.dart';

class CurrentServices {
  static Future<CurrentModel?> getCurrent({double? lat, double? long}) async {
    CurrentModel? datas;
    try {
      var response = await Dio().get(
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=40d1905d9727df12f102fb54da3791c4');
      print(response.statusCode);
      if (response.statusCode == 200) {
        datas = CurrentModel.fromJson(response.data);
        print(datas.name);
        return datas;
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
    return null;
  }
}
