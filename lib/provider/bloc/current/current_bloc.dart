import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:openweather_app/models/current/current.dart';
import 'package:openweather_app/provider/current_repository.dart';

part 'current_event.dart';
part 'current_state.dart';

class CurrentBloc extends Bloc<CurrentEvent, CurrentState> {
  final CurrentRepository currentRepository;
  CurrentBloc({required this.currentRepository}) : super(CurrentInitial()) {
    on<GetCurrentList>(
      (event, emit) async {
        emit(CurrentLoading());
        try {
          final CurrentModel? cList = await currentRepository.getCurrentWeather(
              lat: event.lat, long: event.long);
          emit(CurrentLoaded(cList!));
        } catch (e) {
          emit(const CurrentError('Failed to Fetch Data'));
        }
      },
    );
  }
}
