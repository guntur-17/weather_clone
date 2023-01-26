part of 'current_bloc.dart';

abstract class CurrentState extends Equatable {
  const CurrentState();

  @override
  List<Object> get props => [];
}

class CurrentInitial extends CurrentState {}

class CurrentLoading extends CurrentState {}

class CurrentLoaded extends CurrentState {
  final CurrentModel currentList;
  const CurrentLoaded(this.currentList);
}

class CurrentError extends CurrentState {
  final String? message;
  const CurrentError(this.message);
}
