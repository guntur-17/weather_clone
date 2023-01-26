part of 'current_bloc.dart';

abstract class CurrentEvent extends Equatable {
  const CurrentEvent();

  @override
  List<Object> get props => [];
}

class GetCurrentList extends CurrentEvent {
  final double lat;
  final double long;

  const GetCurrentList({required this.lat, required this.long});
}
