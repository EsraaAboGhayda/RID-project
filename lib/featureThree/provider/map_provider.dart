// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../core/config/handling_model.dart';
// import '../service/getHubs.dart';

// final map_provider_getHubs = FutureProvider<ResultModel>((ref) {
//   return ref.read(map_provider_service).grtAllHub();
// });

// final map_provider_getLocation = FutureProvider<ResultModel>((ref) {
//   return ref.read(map_provider_service).setUserLocationOnMap();
// });

// final map_provider_service = Provider<mapservice>((ref) {
//   return mapservice();
// });

// =======================
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import '../model/UserLocationModel.dart';
import '../../../core/config/handling_model.dart';
import '../service/getHubs.dart';

final userLocationProvider = StateProvider<Position?>((ref) => null);
final map_provider_getHubs =
    FutureProvider.family<ResultModel, UserLocationModel>(
        (ref, userLocation) async {
  return ref.read(map_provider_service).getAllHubs(userLocation);
});

final map_provider_service = Provider<MapService>((ref) {
  return MapService();
});
