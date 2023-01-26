// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:openweather_app/models/current/current.dart';
// import 'package:openweather_app/provider/current_repository.dart';
// import 'package:rxdart/rxdart.dart';

// class CurrentBloc {
//   CurrentRepository _repository = CurrentRepository();

//   final _getCurrent = PublishSubject<CurrentModel>();

//   Stream<CurrentModel> get weather => _getCurrent.stream;

//   getCurrentWeather({double? lat, double? long}) async {
//     CurrentModel? currentModel =
//         await _repository.getCurrentWeather(lat: lat, long: long);
//     _getCurrent.sink.add(currentModel!);
//   }

//   dispose() {
//     _getCurrent.close();
//   }
// }

// final currentBloc = CurrentBloc();
