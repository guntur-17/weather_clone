// import 'package:openweather_app/models/threehours_fivedays/threehours_fivedays.dart';
// import 'package:openweather_app/provider/threehfived_repository.dart';
// import 'package:rxdart/rxdart.dart';

// class ThreeHFiveDBloc {
//   ThreeHFiveDRepository _repository = ThreeHFiveDRepository();

//   final _getThreeHFiveD = PublishSubject<ThreehoursFivedaysModel>();

//   Stream<ThreehoursFivedaysModel> get weather => _getThreeHFiveD.stream;

//   getThreeHFiveD({double? lat, double? long}) async {
//     ThreehoursFivedaysModel? threehoursFivedaysModel =
//         await _repository.getThreeHFiveDWeather(lat: lat, long: long);
//     _getThreeHFiveD.sink.add(threehoursFivedaysModel!);
//   }

//   dispose() {
//     _getThreeHFiveD.close();
//   }
// }

// final threeHFiveDBloc = ThreeHFiveDBloc();
