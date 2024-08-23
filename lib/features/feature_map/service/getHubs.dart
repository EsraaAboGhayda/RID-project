import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ride_project/core/config/core_service.dart';
import 'package:ride_project/core/config/handling_model.dart';
import 'package:ride_project/core/config/header_config.dart';
import 'package:latlong2/latlong.dart';

import '../../featurefour/view/SelectTransport.dart';
import '../model/HubModel.dart';
import '../model/UserLocationModel.dart';

class MapService extends CoreService {
  MapController mapController = MapController();
  var marker = <Marker>[];
  Future<ResultModel> setUserLocationOnMap(
      UserLocationModel userLocation) async {
    //  mapController.move(
    //     LatLng(userLocation.latitude, userLocation.longitude), 15.0);
    marker.add(Marker(
        point: LatLng(userLocation.latitude, userLocation.longitude),
        child: const Icon(
          Icons.location_on,
          color: Colors.red,
        )));
    List<UserLocationModel> locationUser = List.generate(marker.length,
        (index) => UserLocationModel.fromJson(marker[index] as String));
    return ListOf(resutlAsList: locationUser);
  }

  Future<ResultModel> getAllHubs(resutlAsList) async {
    var marker = <Marker>[];
    // late Position currentPosition;

    // Position position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);

    // currentPosition = position;
    try {
      response = await dio.get(
          "https://rideshare.devscape.online/api/v1/hubs?longtitude=${resutlAsList.longitude}&latitude=${resutlAsList.latitude}",
          options: HeaderConfig.getHeader(useToken: true));
      if (response.statusCode == 200) {
        List<HubModel> hubs = List.generate(
          response.data['body'].length,
          (index) => HubModel.fromJson(response.data['body'][index]),
        );
        if (hubs.isNotEmpty) {
          for (int i = 0; i < hubs.length; i++) {
            marker.add(Marker(
                point: LatLng(hubs[i].latitude, hubs[i].longitude),
                child: IconButton(
                  icon: Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 40,
                  ),
                  onPressed: () {
                    // Navigator.pushNamed(
                    //   context,
                    //   '/SelectTransport',
                    //   arguments: SelectTransport(hubId: hubs[i].id),
                    // );
                  },
                ),
                width: 80,
                height: 80));
          }
        }
        return ListOf(resutlAsList: hubs);
      } else {
        return ErrorModel(message: '');
      }
    } on DioException catch (e) {
      print(e.message);
      return ExceptionModel(message: e.message!);
    }
  }
}

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:ride_project/core/config/handling_model.dart';
// import 'package:latlong2/latlong.dart';
// import '../../core/config/core_service.dart';
// import '../../core/config/header_config.dart';
// import '../../featurefour/view/SelectTransport.dart';
// import '../model/HubModel.dart';
// import '../model/UserLocationModel.dart';

// class MapService extends CoreService {
//   MapController mapController = MapController();
//   var markers = <Marker>[];

//   Future<Position> getUserLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }

//     return await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//   }

//   Future<ResultModel> getAllHubs(
//       UserLocationModel location) async {
//     try {
//       response = await dio.get(
//         "https://rideshare.devscape.online/api/v1/hubs?longtitude=${location.longitude}&latitude=${location.latitude}",
//         options: HeaderConfig.getHeader(useToken: false),
//       );

//       if (response.statusCode == 200) {
//         List<HubModel> hubs = List.generate(
//           response.data['body'].length,
//           (index) => HubModel.fromJson(response.data['body'][index]),
//         );

//         return ListOf(resutlAsList: hubs);
//       } else {
//         return ErrorModel(message: "Failed to fetch hubs");
//       }
//     } on DioException catch (e) {
//       return ExceptionModel(message: e.message ?? "An error occurred");
//     }
//   }
// }

// Future<ResultModel> setUserLocationOnMap(
//     UserLocationModel userLocation) async {
//   try {
//     Marker userMarker = Marker(
//       point: LatLng(userLocation.latitude, userLocation.longitude),
//       child: const Icon(Icons.location_on, color: Colors.red),
//     );
//     markers.add(userMarker);

//     return ListOf(resutlAsList: [userLocation]);
//   } catch (e) {
//     return ExceptionModel(message: e.toString());
//   }
// }

// if (hubs.isNotEmpty) {
//   for (HubModel hub in hubs) {
//     markers.add(
//       Marker(
//         point: LatLng(hub.latitude, hub.longitude),
//         child: IconButton(
//           icon: const Icon(Icons.location_on,
//               color: Colors.red, size: 40),
//           onPressed: () {
//             Navigator.pushNamed(
//               context,
//               '/SelectTransport',
//               arguments: SelectTransport(hubId: hub.id),
//             );
//           },
//         ),
//         width: 80,
//         height: 80,
//       ),
//     );
//   }
// }

// =======================

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:latlong2/latlong.dart';
// import '../../../core/config/core_service.dart';
// import '../../../core/config/handling_model.dart';
// import '../../../core/config/header_config.dart';
// import '../model/HubModel.dart';
// import '../model/UserLocationModel.dart';

// class MapService extends CoreService {
//   MapController mapController = MapController();
//   var markers = <Marker>[];

//   Future<Position> getUserLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
//     return await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//   }

//   Future<ResultModel> getAllHubs(
//     UserLocationModel location,
//   ) async {
//     try {
//       response = await dio.get(
//         "https://rideshare.devscape.online/api/v1/hubs?longitude=${location.longitude}&latitude=${location.latitude}",
//         options:
//             //Options(headers: {
//             //   "accept": "*/*",
//             //   "Authorization":
//             //       "Bearer${(core.get<SharedPreferences>().getString('token'))}"
//             // })
//             HeaderConfig.getHeader(useToken: false),
//       );

//       if (response.statusCode == 200) {
//         List<HubModel> hubs = List.generate(
//           response.data['body'].length,
//           (index) => HubModel.fromJson(response.data['body'][index]),
//         );

//         markers = hubs.map((hub) {
//           return Marker(
//             point: LatLng(hub.latitude, hub.longitude),
//             child: IconButton(
//               icon: Icon(Icons.location_on, color: Colors.red, size: 40),
//               onPressed: () {},
//             ),
//             width: 80,
//             height: 80,
//           );
//         }).toList();

//         return ListOf(resutlAsList: hubs);
//       } else {
//         return ErrorModel(message: "Failed to fetch hubs");
//       }
//     } on DioException catch (e) {
//       return ExceptionModel(message: e.message ?? "An error occurred");
//     }
//   }
// }
