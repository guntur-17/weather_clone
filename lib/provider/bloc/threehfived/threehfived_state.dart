part of 'threehfived_bloc.dart';

abstract class ThreehfivedState extends Equatable {
  const ThreehfivedState();

  @override
  List<Object> get props => [];
}

class ThreehfivedInitial extends ThreehfivedState {}

class ThreehfivedLoading extends ThreehfivedState {}

class ThreehfivedLoaded extends ThreehfivedState {
  final ThreehoursFivedaysModel threehoursFivedaysModel;
  const ThreehfivedLoaded(this.threehoursFivedaysModel);
}

class ThreehfivedError extends ThreehfivedState {
  final String? message;
  const ThreehfivedError(this.message);
}
