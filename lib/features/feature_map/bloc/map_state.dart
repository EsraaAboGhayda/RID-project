part of 'map_bloc.dart';

@immutable
sealed class MapState {}

final class MapInitial extends MapState {}

class LoadingStates extends MapState {}

class ErrorState extends MapState {
  String message;
  ErrorState(this.message);
}

class SuccessState extends MapState {
  var data;
  SuccessState(this.data);
}
