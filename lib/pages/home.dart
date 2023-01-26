import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:openweather_app/models/daily_weather_model.dart';
import 'package:openweather_app/models/threehours_fivedays/threehours_fivedays.dart';
import 'package:openweather_app/pages/search.dart';
import 'package:openweather_app/pages/setting.dart';
import 'package:openweather_app/provider/bloc/current/current_bloc.dart';
import 'package:openweather_app/provider/bloc/threehfived/threehfived_bloc.dart';
import 'package:openweather_app/provider/current_bloc/current_bloc.dart';
import 'package:openweather_app/provider/threehoursfivedays_bloc/threehoursfivedays_bloc.dart';
import 'package:openweather_app/widgets/daily_weather.dart';
import 'package:openweather_app/widgets/weather_slide_icon.dart';

import '../models/current/current.dart';
import '../style/style.dart';

class HomePage extends StatefulWidget {
  double? lat;
  double? long;
  String? location;
  HomePage({Key? key, this.lat, this.long, this.location}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CurrentBloc currentBloc;
  late ThreehfivedBloc threehfivedBloc;

  @override
  void initState() {
    currentBloc = BlocProvider.of<CurrentBloc>(context);
    currentBloc.add(GetCurrentList(lat: widget.lat!, long: widget.long!));

    threehfivedBloc = BlocProvider.of<ThreehfivedBloc>(context);
    threehfivedBloc
        .add(GetThreeHFiveDList(lat: widget.lat!, long: widget.long!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget top(CurrentModel data) {
      String? iconCode = data.weather?.first.icon!;
      double? currentTemp = data.main?.temp ?? 0;
      double? feelsTemp = data.main?.feelsLike ?? 0;
      return Container(
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    child: Align(
                      alignment: Alignment.center,
                      widthFactor: 0.6,
                      heightFactor: 0.6,
                      child: Image.network(
                        "http://openweathermap.org/img/wn/$iconCode@2x.png",
                        width: 80,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.weather!.first.main!,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        data.weather!.first.description!,
                        style: greyMontStyle.copyWith(fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
              Text(
                '${'${currentTemp - 273.15}'.substring(0, 4)}°C',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Feels Like ${'${feelsTemp - 273.15}'.substring(0, 4)} °C',
                style: greyMontStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
      );
    }

    Widget middle(CurrentModel data) {
      return Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? Color(0xff313133)
                : Color(0xfff2f2f2),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Winds: ${data.wind?.speed}m/s WNW',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'Humidity: ${data.main?.humidity}%',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Visibility: ${data.visibility! / 1000}km',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'Pressure: ${data.main?.pressure}hPa',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget bottom(ThreehoursFivedaysModel data) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 12),
                  height: 90,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.list?.length,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final allDatas = data.list?[index];

                      return WeatherSlideIcon(datas: allDatas);
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final allDatas = data.list?[index];
                      return DailyWeather(
                        datas: allDatas,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget mainBody(BuildContext context, CurrentModel data,
        ThreehoursFivedaysModel data2) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchPage(),
                      ));
                },
                child: Icon(Icons.search)),
            title: Text(widget.location!),
            titleSpacing: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingPage(),
                          ));
                    },
                    child: Icon(Icons.tune)),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  top(data),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  middle(data),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  bottom(data2)
                ],
              ),
            ),
          ),
        ),
      );
    }

    // Widget fakeSplash() {
    //   return Column(
    //     children: [
    //       SizedBox(
    //         height: MediaQuery.of(context).size.height * 0.3,
    //       ),
    //       Column(
    //         children: [
    //           Image.asset(
    //             'assets/icon_nobg.png',
    //             width: 120,
    //           ),
    //           Text(
    //             'Fetching Weather Data...',
    //             style: Theme.of(context).textTheme.labelMedium,
    //           ),
    //         ],
    //       ),
    //       Spacer(),
    //       Padding(
    //         padding: const EdgeInsets.only(bottom: 20.0),
    //         child: Text(
    //           'OpenWeather',
    //           style: Theme.of(context).textTheme.labelMedium,
    //         ),
    //       ),
    //     ],
    //   );
    // }

    return MultiBlocListener(
      listeners: [
        BlocListener<CurrentBloc, CurrentState>(
          listener: (context, state) {
            if (state is CurrentError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
        ),
        BlocListener<ThreehfivedBloc, ThreehfivedState>(
          listener: (context, state) {
            if (state is ThreehfivedError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
        ),
      ],
      child: BlocBuilder<CurrentBloc, CurrentState>(
        builder: (context, state1) {
          return BlocBuilder<ThreehfivedBloc, ThreehfivedState>(
            builder: (context, state2) {
              if (state1 is CurrentInitial || state2 is ThreehfivedInitial) {
                return buildLoading();
              } else if (state1 is CurrentLoading ||
                  state2 is ThreehfivedLoading) {
                return buildLoading();
              } else if (state1 is CurrentLoaded &&
                  state2 is ThreehfivedLoaded) {
                return mainBody(context, state1.currentList,
                    state2.threehoursFivedaysModel);
              } else if (state1 is CurrentError || state2 is ThreehfivedError) {
                return Container();
              } else {
                return Container();
              }
            },
          );
        },
      ),
    );
  }

  Widget buildLoading() => const Center(child: CircularProgressIndicator());
}
