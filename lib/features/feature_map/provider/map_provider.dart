// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../core/config/handling_model.dart';
// import '../service/getHubs.dart';

// final map_provider_getHubs = FutureProvider<ResultModel>((ref) {
//   return ref.read(map_provider_service).getAllHubs();
// });

// final map_provider_getLocation = FutureProvider<ResultModel>((ref) {
//   return ref.read(map_provider_service).setUserLocationOnMap();
// });

// final map_provider_service = Provider<MapService>((ref) {
//   return MapService();
// });

// ================================

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/UserLocationModel.dart';
import '../../../core/config/handling_model.dart';
import '../service/getHubs.dart';

final map_provider_service = Provider<MapService>((ref) {
  return MapService();
});

final map_provider_getHubs =
    FutureProvider.family<ResultModel, UserLocationModel>((ref, userLocation) {
  return ref.read(map_provider_service).getAllHubs(userLocation);
});

final map_provider_getLocation =
    FutureProvider.family<ResultModel, UserLocationModel>((ref, userLocation) {
  return ref.read(map_provider_service).setUserLocationOnMap(userLocation);
});

// =================================

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../model/UserLocationModel.dart';
// import '../../core/config/handling_model.dart';
// import 'package:geolocator/geolocator.dart';

// import '../service/getHubs.dart';

// final userLocationProvider = FutureProvider<Position>((ref) async {
//   return await getUserLocation();
// });

// final map_provider_getHubs = FutureProvider<ResultModel>((ref) async {
//   final position = await ref.watch(userLocationProvider.future);
//   final userLocation = UserLocationModel(
//       latitude: position.latitude, longitude: position.longitude);

//   return ref.read(map_provider_service).getAllHubs(userLocation);
// });

// final map_provider_service = Provider<MapService>((ref) {
//   return MapService();
// });
// ======================================

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:geolocator/geolocator.dart';
// import '../model/UserLocationModel.dart';
// import '../../../core/config/handling_model.dart';
// import '../service/getHubs.dart';

// final userLocationProvider = StateProvider<Position?>((ref) => null);

// //  final userLocationProvider = FutureProvider<Position>((ref) async {
// //   return await getUserLocation();
// // });

// // final map_provider_getHubs = FutureProvider<ResultModel>((ref) async {
// //   final position = await ref.watch(userLocationProvider.future);
// //   final userLocation = UserLocationModel(
// //       latitude: position?.latitude, longitude: position.longitude);

// //   return ref.read(map_provider_service).getAllHubs(userLocation);
// // });

// final map_provider_getHubs =
//     FutureProvider.family<ResultModel, UserLocationModel>(
//         (ref, userLocation) async {
//   return ref.read(map_provider_service).getAllHubs(userLocation);
// });

// final map_provider_service = Provider<MapService>((ref) {
//   return MapService();
// });
