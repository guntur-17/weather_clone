// import 'dart:math';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:openweather_app/models/current/current.dart';
// import 'package:openweather_app/models/daily_weather_model.dart';
// import 'package:openweather_app/models/slider_model_test.dart';
// import 'package:openweather_app/pages/setting.dart';
// import 'package:openweather_app/provider/current_bloc/current_bloc.dart';
// import 'package:openweather_app/widgets/daily_weather.dart';
// import 'package:openweather_app/widgets/weather_slide_icon.dart';

// import '../style/style.dart';

// class DumpPage extends StatefulWidget {
//   const DumpPage({Key? key}) : super(key: key);

//   @override
//   State<DumpPage> createState() => _DumpPageState();
// }

// class _DumpPageState extends State<DumpPage> {
//   double? lat = -6.274405216395327;
//   double? long = 106.73461503674848;
//   late CurrentBloc getBlocs;

//   blocInitializer() {
//     final CurrentBloc _getBloc = CurrentBloc(lat: lat, long: long);

//     getBlocs = _getBloc;
//   }

//   initHandler() async {
//     await blocInitializer();
//     getBlocs.add(GetCurrentList());
//   }

//   @override
//   void initState() {
//     initHandler();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final allData = [
//       SliderModel(
//           icon: "http://openweathermap.org/img/wn/10d@2x.png",
//           time: "23:00",
//           temp: 27),
//       SliderModel(
//           icon: "http://openweathermap.org/img/wn/10d@2x.png",
//           time: "23:00",
//           temp: 27),
//       SliderModel(
//           icon: "http://openweathermap.org/img/wn/10d@2x.png",
//           time: "23:00",
//           temp: 27),
//       SliderModel(
//           icon: "http://openweathermap.org/img/wn/10d@2x.png",
//           time: "23:00",
//           temp: 27),
//       SliderModel(
//           icon: "http://openweathermap.org/img/wn/10d@2x.png",
//           time: "23:00",
//           temp: 27),
//       SliderModel(
//           icon: "http://openweathermap.org/img/wn/10d@2x.png",
//           time: "23:00",
//           temp: 27),
//       SliderModel(
//           icon: "http://openweathermap.org/img/wn/10d@2x.png",
//           time: "23:00",
//           temp: 27),
//     ];

//     final dailyData = [
//       DailyModel(
//           icon: "http://openweathermap.org/img/wn/10d@2x.png",
//           date: "23:00",
//           feelstemp: 29,
//           temp: 27),
//       DailyModel(
//           icon: "http://openweathermap.org/img/wn/10d@2x.png",
//           date: "23:00",
//           feelstemp: 30,
//           temp: 27),
//       DailyModel(
//           icon: "http://openweathermap.org/img/wn/10d@2x.png",
//           date: "23:00",
//           feelstemp: 29,
//           temp: 27),
//       DailyModel(
//           icon: "http://openweathermap.org/img/wn/10d@2x.png",
//           date: "23:00",
//           feelstemp: 27,
//           temp: 27),
//       DailyModel(
//           icon: "http://openweathermap.org/img/wn/10d@2x.png",
//           date: "23:00",
//           feelstemp: 28,
//           temp: 27),
//     ];

//     Widget _buildLoading() => Center(child: CircularProgressIndicator());

//     Widget top(BuildContext context, CurrentModel model) {
//       double? currentTemp = model.main?.temp ?? 0;

//       return Container(
//         child: Padding(
//           padding:
//               EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ClipRRect(
//                     child: Align(
//                       alignment: Alignment.center,
//                       widthFactor: 0.6,
//                       heightFactor: 0.6,
//                       child: Image.network(
//                         "http://openweathermap.org/img/wn/10d@2x.png",
//                         width: 80,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 8,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Few clouds',
//                         style: Theme.of(context).textTheme.labelMedium,
//                       ),
//                       SizedBox(
//                         height: 4,
//                       ),
//                       Text(
//                         'Moderate Breeze',
//                         style: greyMontStyle.copyWith(fontSize: 12),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//               Text(
//                 '${currentTemp - 273.15} °C',
//                 style: Theme.of(context).textTheme.bodyLarge,
//               ),
//               SizedBox(
//                 height: 12,
//               ),
//               Text(
//                 'Feels Like 31°C',
//                 style: greyMontStyle.copyWith(fontSize: 12),
//               ),
//             ],
//           ),
//         ),
//       );
//     }

//     Widget middle() {
//       return Container(
//         padding: EdgeInsets.all(20),
//         width: MediaQuery.of(context).size.width * 0.95,
//         decoration: BoxDecoration(
//             color: Theme.of(context).brightness == Brightness.dark
//                 ? Color(0xff313133)
//                 : Color(0xfff2f2f2),
//             borderRadius: BorderRadius.circular(8)),
//         child: Column(
//           children: [
//             Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Winds',
//                       style: Theme.of(context).textTheme.bodyMedium,
//                     ),
//                     Text(
//                       'Humidity',
//                       style: Theme.of(context).textTheme.bodyMedium,
//                     ),
//                     Text(
//                       'UV Index',
//                       style: Theme.of(context).textTheme.bodyMedium,
//                     ),
//                     Text(
//                       'Pressure',
//                       style: Theme.of(context).textTheme.bodyMedium,
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.03,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Visibility',
//                       style: Theme.of(context).textTheme.bodyMedium,
//                     ),
//                     Text(
//                       'Dew Points',
//                       style: Theme.of(context).textTheme.bodyMedium,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       );
//     }

//     Widget bottom() {
//       return Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 Container(
//                   padding: EdgeInsets.only(left: 12),
//                   height: 90,
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: allData.length,
//                     scrollDirection: Axis.horizontal,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemBuilder: (context, index) {
//                       final allDatas = allData[index];

//                       return WeatherSlideIcon(datas: allDatas);
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 20),
//             child: Container(
//               child: Column(
//                 children: [
//                   ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: dailyData.length,
//                     itemBuilder: (context, index) {
//                       final dailyDatas = dailyData[index];
//                       return DailyWeather(
//                         datas: dailyDatas,
//                       );
//                     },
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       );
//     }

//     Widget buildApp(BuildContext context, CurrentModel model) {
//       return SafeArea(
//         child: Scaffold(
//           appBar: AppBar(
//             leading: Icon(Icons.search),
//             title: Text("Location XXX"),
//             titleSpacing: 0,
//             actions: [
//               Padding(
//                 padding: const EdgeInsets.only(right: 12.0),
//                 child: InkWell(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => SettingPage(),
//                           ));
//                     },
//                     child: Icon(Icons.tune)),
//               )
//             ],
//           ),
//           body: SingleChildScrollView(
//             child: Center(
//               child: Column(
//                 children: [
//                   top(context, model),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.05,
//                   ),
//                   middle(),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.03,
//                   ),
//                   bottom()
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     }

//     return BlocListener(
//       listener: (context, state) {
//         if (state is CurrentError) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(state.message!),
//             ),
//           );
//         }
//       },
//       child: BlocBuilder<CurrentBloc, CurrentState>(
//         builder: (context, state) {
//           if (state is CurrentInitial) {
//             return _buildLoading();
//           } else if (state is CurrentLoading) {
//             return _buildLoading();
//           } else if (state is CurrentLoaded) {
//             return buildApp(context, state.currentList);
//           } else if (state is CurrentError) {
//             return Container();
//           } else {
//             return Container();
//           }
//         },
//       ),
//     );
//   }
// }

// // class HomePage extends StatefulWidget {
// //   const HomePage({Key? key}) : super(key: key);

// //   @override
// //   State<HomePage> createState() => _HomePageState();
// // }

// // class _HomePageState extends State<HomePage> {
// //   // double? lat = -6.274405216395327;
// //   // double? long = 106.73461503674848;
// //   // late CurrentBloc getBlocs;

// //   // blocInitializer() {
// //   //   final CurrentBloc _getBloc = CurrentBloc(lat: lat, long: long);

// //   //   getBlocs = _getBloc;
// //   // }

// //   // initHandler() async {
// //   //   await blocInitializer();
// //   //   getBlocs.add(GetCurrentList());
// //   // }

// //   @override
// //   void initState() {
// //     // initHandler();
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final allData = [
// //       SliderModel(
// //           icon: "http://openweathermap.org/img/wn/10d@2x.png",
// //           time: "23:00",
// //           temp: 27),
// //       SliderModel(
// //           icon: "http://openweathermap.org/img/wn/10d@2x.png",
// //           time: "23:00",
// //           temp: 27),
// //       SliderModel(
// //           icon: "http://openweathermap.org/img/wn/10d@2x.png",
// //           time: "23:00",
// //           temp: 27),
// //       SliderModel(
// //           icon: "http://openweathermap.org/img/wn/10d@2x.png",
// //           time: "23:00",
// //           temp: 27),
// //       SliderModel(
// //           icon: "http://openweathermap.org/img/wn/10d@2x.png",
// //           time: "23:00",
// //           temp: 27),
// //       SliderModel(
// //           icon: "http://openweathermap.org/img/wn/10d@2x.png",
// //           time: "23:00",
// //           temp: 27),
// //       SliderModel(
// //           icon: "http://openweathermap.org/img/wn/10d@2x.png",
// //           time: "23:00",
// //           temp: 27),
// //     ];

// //     final dailyData = [
// //       DailyModel(
// //           icon: "http://openweathermap.org/img/wn/10d@2x.png",
// //           date: "23:00",
// //           feelstemp: 29,
// //           temp: 27),
// //       DailyModel(
// //           icon: "http://openweathermap.org/img/wn/10d@2x.png",
// //           date: "23:00",
// //           feelstemp: 30,
// //           temp: 27),
// //       DailyModel(
// //           icon: "http://openweathermap.org/img/wn/10d@2x.png",
// //           date: "23:00",
// //           feelstemp: 29,
// //           temp: 27),
// //       DailyModel(
// //           icon: "http://openweathermap.org/img/wn/10d@2x.png",
// //           date: "23:00",
// //           feelstemp: 27,
// //           temp: 27),
// //       DailyModel(
// //           icon: "http://openweathermap.org/img/wn/10d@2x.png",
// //           date: "23:00",
// //           feelstemp: 28,
// //           temp: 27),
// //     ];

// //     Widget _buildLoading() => Center(child: CircularProgressIndicator());

// //     Widget top(BuildContext context, CurrentModel model) {
// //       double? currentTemp = model.main?.temp ?? 0;

// //       return Container(
// //         child: Padding(
// //           padding:
// //               EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
// //           child: Column(
// //             children: [
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   ClipRRect(
// //                     child: Align(
// //                       alignment: Alignment.center,
// //                       widthFactor: 0.6,
// //                       heightFactor: 0.6,
// //                       child: Image.network(
// //                         "http://openweathermap.org/img/wn/10d@2x.png",
// //                         width: 80,
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     width: 8,
// //                   ),
// //                   Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         'Few clouds',
// //                         style: Theme.of(context).textTheme.labelMedium,
// //                       ),
// //                       SizedBox(
// //                         height: 4,
// //                       ),
// //                       Text(
// //                         'Moderate Breeze',
// //                         style: greyMontStyle.copyWith(fontSize: 12),
// //                       )
// //                     ],
// //                   )
// //                 ],
// //               ),
// //               Text(
// //                 '${currentTemp - 273.15} °C',
// //                 style: Theme.of(context).textTheme.bodyLarge,
// //               ),
// //               SizedBox(
// //                 height: 12,
// //               ),
// //               Text(
// //                 'Feels Like 31°C',
// //                 style: greyMontStyle.copyWith(fontSize: 12),
// //               ),
// //             ],
// //           ),
// //         ),
// //       );
// //     }

// //     Widget _showTop() {
// //       return BlocListener(
// //         listener: (context, state) {
// //           if (state is CurrentError) {
// //             ScaffoldMessenger.of(context).showSnackBar(
// //               SnackBar(
// //                 content: Text(state.message!),
// //               ),
// //             );
// //           }
// //         },
// //         child: BlocBuilder<CurrentBloc, CurrentState>(
// //           builder: (context, state) {
// //             if (state is CurrentInitial) {
// //               return _buildLoading();
// //             } else if (state is CurrentLoading) {
// //               return _buildLoading();
// //             } else if (state is CurrentLoaded) {
// //               return top(context, state.currentList);
// //             } else if (state is CurrentError) {
// //               return Container();
// //             } else {
// //               return Container();
// //             }
// //           },
// //         ),
// //       );
// //     }

// //     Widget middle() {
// //       return Container(
// //         padding: EdgeInsets.all(20),
// //         width: MediaQuery.of(context).size.width * 0.95,
// //         decoration: BoxDecoration(
// //             color: Theme.of(context).brightness == Brightness.dark
// //                 ? Color(0xff313133)
// //                 : Color(0xfff2f2f2),
// //             borderRadius: BorderRadius.circular(8)),
// //         child: Column(
// //           children: [
// //             Column(
// //               children: [
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Text(
// //                       'Winds',
// //                       style: Theme.of(context).textTheme.bodyMedium,
// //                     ),
// //                     Text(
// //                       'Humidity',
// //                       style: Theme.of(context).textTheme.bodyMedium,
// //                     ),
// //                     Text(
// //                       'UV Index',
// //                       style: Theme.of(context).textTheme.bodyMedium,
// //                     ),
// //                     Text(
// //                       'Pressure',
// //                       style: Theme.of(context).textTheme.bodyMedium,
// //                     ),
// //                   ],
// //                 ),
// //                 SizedBox(
// //                   height: MediaQuery.of(context).size.height * 0.03,
// //                 ),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Text(
// //                       'Visibility',
// //                       style: Theme.of(context).textTheme.bodyMedium,
// //                     ),
// //                     Text(
// //                       'Dew Points',
// //                       style: Theme.of(context).textTheme.bodyMedium,
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       );
// //     }

// //     Widget bottom() {
// //       return Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           SingleChildScrollView(
// //             scrollDirection: Axis.horizontal,
// //             child: Row(
// //               children: [
// //                 Container(
// //                   padding: EdgeInsets.only(left: 12),
// //                   height: 90,
// //                   child: ListView.builder(
// //                     shrinkWrap: true,
// //                     itemCount: allData.length,
// //                     scrollDirection: Axis.horizontal,
// //                     physics: const NeverScrollableScrollPhysics(),
// //                     itemBuilder: (context, index) {
// //                       final allDatas = allData[index];

// //                       return WeatherSlideIcon(datas: allDatas);
// //                     },
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.only(top: 20),
// //             child: Container(
// //               child: Column(
// //                 children: [
// //                   ListView.builder(
// //                     shrinkWrap: true,
// //                     itemCount: dailyData.length,
// //                     itemBuilder: (context, index) {
// //                       final dailyDatas = dailyData[index];
// //                       return DailyWeather(
// //                         datas: dailyDatas,
// //                       );
// //                     },
// //                   )
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ],
// //       );
// //     }

// //     return SafeArea(
// //       child: Scaffold(
// //         appBar: AppBar(
// //           leading: Icon(Icons.search),
// //           title: Text("Location XXX"),
// //           titleSpacing: 0,
// //           actions: [
// //             Padding(
// //               padding: const EdgeInsets.only(right: 12.0),
// //               child: InkWell(
// //                   onTap: () {
// //                     Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                           builder: (context) => SettingPage(),
// //                         ));
// //                   },
// //                   child: Icon(Icons.tune)),
// //             )
// //           ],
// //         ),
// //         body:
// //             // SingleChildScrollView(
// //             //   child:
// //             Center(
// //           child: Column(
// //             children: [
// //               _showTop(),
// //               SizedBox(
// //                 height: MediaQuery.of(context).size.height * 0.05,
// //               ),
// //               middle(),
// //               SizedBox(
// //                 height: MediaQuery.of(context).size.height * 0.03,
// //               ),
// //               // bottom()
// //             ],
// //           ),
// //         ),
// //         // ),
// //       ),
// //     );
// //   }
// // }
