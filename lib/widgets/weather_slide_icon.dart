import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:openweather_app/models/threehours_fivedays/listmodel.dart';
import 'package:openweather_app/style/style.dart';

class WeatherSlideIcon extends StatelessWidget {
  final ListModel? datas;
  const WeatherSlideIcon({
    super.key,
    required this.datas,
  });

  @override
  Widget build(BuildContext context) {
    String? iconCode = datas!.weather!.first.icon!;
    double? currentTemp = datas!.main?.temp ?? 0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 48,
        child: Column(children: [
          Text(
            datas!.dtTxt!.substring(11, 16),
            style: greyMontStyle.copyWith(fontSize: 12),
          ),
          ClipRRect(
            child: Align(
              alignment: Alignment.center,
              widthFactor: 0.6,
              heightFactor: 1,
              child: Image.network(
                "http://openweathermap.org/img/wn/$iconCode@2x.png",
                width: 40,
              ),
            ),
          ),
          Text(
            '${'${currentTemp - 273.15}'.substring(0, 4)}°C',
            style: Theme.of(context).textTheme.labelMedium,
          )
        ]),
      ),
    );
  }
}
