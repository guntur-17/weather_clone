import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:openweather_app/pages/home.dart';
import 'package:openweather_app/provider/bloc/current/current_bloc.dart';
import 'package:openweather_app/provider/bloc/threehfived/threehfived_bloc.dart';
import 'package:openweather_app/provider/current_repository.dart';
import 'package:openweather_app/provider/threehfived_repository.dart';
import 'package:openweather_app/splash_page.dart';
import 'package:openweather_app/style/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CurrentBloc(currentRepository: CurrentRepository()),
        ),
        BlocProvider(
          create: (context) =>
              ThreehfivedBloc(threeHFiveDRepository: ThreeHFiveDRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: white,
          textTheme: TextTheme(
              labelMedium: blackMontStyle.copyWith(fontSize: 14),
              bodyMedium:
                  blackRobotoStyle.copyWith(fontSize: 12, fontWeight: bold),
              bodyLarge:
                  blackMontStyle.copyWith(fontSize: 52, fontWeight: light)),
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: black),
              color: white,
              titleTextStyle:
                  blackInterStyle.copyWith(fontSize: 16, fontWeight: bold)),
          brightness: Brightness.light,
          /* light theme settings */
        ),
        darkTheme: ThemeData(
            scaffoldBackgroundColor: backBlack,
            textTheme: TextTheme(
                labelMedium: whiteMontStyle.copyWith(fontSize: 14),
                bodyMedium:
                    whiteInterStyle.copyWith(fontSize: 12, fontWeight: bold),
                bodyLarge:
                    whiteMontStyle.copyWith(fontSize: 52, fontWeight: light)),
            brightness: Brightness.dark,
            appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: white),
                color: backBlack,
                titleTextStyle:
                    whiteInterStyle.copyWith(fontSize: 16, fontWeight: bold))
            /* dark theme settings */
            ),
        themeMode: ThemeMode.system,
        home: const SplashPage(),
      ),
    );
  }
}
