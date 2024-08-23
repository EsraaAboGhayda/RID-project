part of 'map_bloc.dart';

@immutable
sealed class MapEvent {}

class getLocationUser extends MapEvent {}

class getHubs extends MapEvent {}
