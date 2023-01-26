import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:openweather_app/models/threehours_fivedays/threehours_fivedays.dart';

import 'package:openweather_app/provider/threehfived_repository.dart';

part 'threehfived_event.dart';
part 'threehfived_state.dart';

class ThreehfivedBloc extends Bloc<ThreehfivedEvent, ThreehfivedState> {
  final ThreeHFiveDRepository threeHFiveDRepository;
  ThreehfivedBloc({required this.threeHFiveDRepository})
      : super(ThreehfivedInitial()) {
    on<GetThreeHFiveDList>(
      (event, emit) async {
        emit(ThreehfivedLoading());
        try {
          final ThreehoursFivedaysModel? cList = await threeHFiveDRepository
              .getThreeHFiveDWeather(lat: event.lat, long: event.long);
          emit(ThreehfivedLoaded(cList!));
        } on NetworkError {
          emit(const ThreehfivedError("Failed to fetch data"));
        }
      },
    );
  }
}
