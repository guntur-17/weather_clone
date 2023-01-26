import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:openweather_app/models/daily_weather_model.dart';
import 'package:openweather_app/models/threehours_fivedays/listmodel.dart';

import '../style/style.dart';

class DailyWeather extends StatelessWidget {
  final ListModel? datas;
  const DailyWeather({
    super.key,
    required this.datas,
  });

  @override
  Widget build(BuildContext context) {
    String? iconCode = datas!.weather!.first.icon!;
    double? minTemp = datas!.main?.tempMin ?? 0;
    double? maxTemp = datas!.main?.tempMax ?? 0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: white, width: 0.8))),
        height: MediaQuery.of(context).size.height * 0.08,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                datas!.dtTxt!.substring(0, 16),
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Row(
                children: [
                  Text(
                    '${'${minTemp - 273.15}'.substring(0, 4)}°C / ${'${maxTemp - 273.15}'.substring(0, 4)}°C',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: ClipRRect(
                      child: Align(
                        alignment: Alignment.center,
                        widthFactor: 0.6,
                        heightFactor: 1,
                        child: Image.network(
                          "http://openweathermap.org/img/wn/$iconCode@2x.png",
                          width: 32,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
