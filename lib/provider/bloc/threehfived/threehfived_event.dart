part of 'threehfived_bloc.dart';

abstract class ThreehfivedEvent extends Equatable {
  const ThreehfivedEvent();

  @override
  List<Object> get props => [];
}

class GetThreeHFiveDList extends ThreehfivedEvent {
  final double lat;
  final double long;

  const GetThreeHFiveDList({required this.lat, required this.long});
}
