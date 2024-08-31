// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:geolocator/geolocator.dart';
// import '../../core/resources/assets.dart';
// import '../../core/resources/colors.dart';
// import '../../core/widgets/app_Button.dart';
// import '../provider/map_provider.dart';
// import 'package:latlong2/latlong.dart';

// class MapPage extends StatefulWidget {
//   MapPage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<MapPage> createState() => _MapPageState();
// }

// // MapController mapController = MapController();
// // Future<void> setUserLocationOnMap(User_location_model userLocation) async {
// //   var mm = mapController.move(
// //       LatLng(userLocation.latitude, userLocation.longtitude), 15.0);
// // }

// class _MapPageState extends State<MapPage> {
//   late MapController mapController;
//   late Position currentPosition;

//   @override
//   void initState() {
//     super.initState();
//     mapController = MapController();
//     // getLocation();
//   }

//   // void getLocation() async {
//   //   Position position = await Geolocator.getCurrentPosition(
//   //       desiredAccuracy: LocationAccuracy.high);
//   //   setState(() {
//   //     currentPosition = position;
//   //   }
//   //   );
//     // setUserLocationOnMap(position.latitude, position.longitude);
//     // var markers = <Marker>[];
//     @override
//     Widget build(BuildContext context) {
//       bool showContainer = false;
//       return Scaffold(
//         body: Consumer(
//           builder: (context, ref, _) {
//             return ref.watch(userLocationProvider).when(
//               data: (data) {
//                 return Stack(children: [
//                   FlutterMap(
//                     // mapController: showContainer;
//                     options: MapOptions(
//                       // initialCenter: LatLng(33.510414, 36.278336),
//                       // initialZoom: 10,
//                       initialCenter: LatLng(data.latitude, data.longitude),
//                       initialZoom: 13.0,
//                       // controller: mapController,

//                       // onTap: (tapPosition, point) {
//                       //   print(point.latitude);
//                       //   print(point.longitude);
//                       //   markers.add(Marker(
//                       //       point: LatLng(point.latitude, point.longitude),
//                       //       child:
//                       //        const Icon(
//                       //         Icons.location_on,
//                       //         color: Colors.red,
//                       //       )
//                       //       )

//                       //       );
//                       // },
//                     ),

//                     children: [
//                       TileLayer(
//                         urlTemplate:
//                             'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//                         userAgentPackageName: 'com.example.app',
//                       ),
//                       // RichAttributionWidget(
//                       //   popupBackgroundColor: Colors.brown,
//                       //   attributions: [
//                       //     TextSourceAttribution(
//                       //       'OpenStreetMap contributors',
//                       //     ),
//                       //   ],
//                       // ),
//                       MarkerLayer(
//                         markers: [
//                           Marker(
//                               width: 80.0,
//                               height: 80.0,
//                               point: LatLng(data.latitude, data.longitude),
//                               child: IconButton(
//                                   onPressed: () {
//                                     mapController.move(
//                                         LatLng(data.latitude!, data.longitude!),
//                                         15.0);
//                                   },
//                                   icon: Icon(
//                                     Icons.location_pin,
//                                     size: 18,
//                                     color: Colors.red,
//                                   ))
//                               // child: const Icon(
//                               //   Icons.location_pin,
//                               //   color: Colors.red,
//                               // ),
//                               ),
//                         ],
//                       ),
//                       FloatingActionButton(onPressed: () {
//                         setState(() {
//                           showContainer = !showContainer;
//                         });
//                       }),
//                     ],
//                   ),
//                   showContainer
//                       ? Container()
//                       : Center(
//                           child: Container(
//                             width: 300,
//                             height: 400,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.white),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   AssetsManager.location,
//                                   width: 150,
//                                   height: 150,
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Center(
//                                     child: Text(
//                                   "Enable your location",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 20),
//                                 )),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Text(
//                                   "choose your location to start find the \n             request arounded you",
//                                   style: TextStyle(color: Colors.grey),
//                                 ),
//                                 SizedBox(height: 15),
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 10, right: 10),
//                                   child: PublicButton(
//                                     text: "Use my location",
//                                     color:
//                                         ColorsManager.txt_buttonColor_secondary,
//                                     textStyle: TextStyle(
//                                       fontSize: 15,
//                                       color: Colors.white,
//                                     ),
//                                     width: 340.0,
//                                     height: 54.0,
//                                     borderRadius: 8.0,
//                                     side: BorderSide(
//                                       color: ColorsManager
//                                           .border_buttonColor_secondary,
//                                       width: 1.0,
//                                     ),
//                                     onPressed: () {},
//                                   ),
//                                 ),
//                                 SizedBox(height: 20),
//                                 InkWell(
//                                     onTap: () {},
//                                     child: Center(
//                                         child: Text("Skip for now",
//                                             style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 15))))
//                               ],
//                             ),
//                           ),
//                         )
//                 ]);
//               },
//               error: (error, stackTrace) {
//                 return Text("There is An Error");
//               },
//               loading: () {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               },
//             );
//           },
//         ),
//       );
//     }
//   // }

//   // @override
//   // Widget build(Object context) {
//   //   // TODO: implement build
//   //   throw UnimplementedError();
//   // }

// }

// =================================
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:latlong2/latlong.dart';

// import '../../../../core/config/handling_model.dart';
// import '../../../core/resources/colors.dart';
// import '../../feature_transport/view/SelectTransport.dart';
// import '../model/HubModel.dart';
// import '../model/UserLocationModel.dart';
// import '../provider/map_provider.dart';

// final userLocationProvider = StateProvider<Position?>((ref) => null);

// class MapScreen extends ConsumerWidget {
//   MapScreen({
//     super.key,
//   });
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final userLocation = ref.watch(userLocationProvider);

//     final hubsAsyncValue = userLocation != null
//         ? ref.watch(map_provider_getLocation(UserLocationModel(
//             latitude: userLocation.latitude,
//             longitude: userLocation.longitude)))
//         : AsyncValue.loading();

//     // ref.watch(map_provider_getHubs(
//     //     HubCategoryParams(userLocationtohub as UserLocationModel, contexttohub as BuildContext)));

//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Map Screen'),
//       // ),
//       body: ref
//           .watch(map_provider_getHubs(userLocation as UserLocationModel))
//           .when(data: (data) {
//         return Stack(
//           children: [
//             FlutterMap(
//               options: MapOptions(
//                 initialCenter: userLocation != null
//                     ? LatLng(userLocation.latitude, userLocation.longitude)
//                     : LatLng(33.510414, 36.278336),
//                 initialZoom: 13.0,
//               ),
//               children: [
//                 TileLayer(
//                   urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//                   userAgentPackageName: 'com.example.app',
//                 ),

//                 //  return
//                 // MarkerLayer(
//                 //markers:List.generate(stateTwo.data.length, (index) {
//                 //                        return Marker(
//                 //                          point:  LatLng(stateTwo.data[index].latitude, stateTwo.data[index].longitude),
//                 //                          child: IconButton(
//                 //                            icon:const Icon(Icons.location_on,color: darkRedColor,size: 40,),
//                 //                            onPressed: (){
//                 //                              Navigator.pushNamed(context,'/SelectTransport',arguments: SelectTransport(
//                 //                                  hubId:stateTwo.data[index].id
//                 //                              ),);
//                 //                              print(stateTwo.data[index].id);
//                 //                              FlutterMapMath flutterMapMath=FlutterMapMath();
//                 //                              distance = flutterMapMath.distanceBetween(
//                 //                                  state.data.latitude!,
//                 //                                  state.data.longitude!,
//                 //                                  stateTwo.data[index].latitude,
//                 //                                  stateTwo.data[index].longitude,
//                 //                                  "meters"
//                 //                              );
//                 //                            },
//                 //                          ),
//                 //                          width: 80,
//                 //                          height: 80
//                 //                        );
//                 //                     },)
//                 //                     );
//                 MarkerLayer(
//                     markers: List.generate(
//                   // (data as ListOf<HubModel>).resutlAsList.length,
//                   (data as DataSuccess).data.resutlAsList.length,
//                   (index) {
//                     return Marker(
//                         point: LatLng(data.data.resutlAsList[index].latitude,
//                             data.data.resutlAsList[index].longitude),
//                         child: IconButton(
//                           icon: const Icon(
//                             Icons.location_on,
//                             color: Colors.red,
//                             size: 40,
//                           ),
//                           onPressed: () {
//                             Navigator.pushNamed(
//                               context,
//                               '/SelectTransport',
//                               arguments: SelectTransport(
//                                   hubId: data.data.resutlAsList[index].id),
//                             );
//                           },
//                         ),
//                         width: 80,
//                         height: 80);
//                   },
//                 ))
//                 // MarkerLayer(
//                 // markers: [
//                 //                marker.add(Marker(
//                 //         point: LatLng(hubs[i].latitude, hubs[i].longitude),
//                 //         child: IconButton(
//                 //           icon: Icon(
//                 //             Icons.location_on,
//                 //             color: Colors.red,
//                 //             size: 40,
//                 //           ),
//                 //           onPressed: () {
//                 //             Navigator.pushNamed(
//                 //               context,
//                 //               '/SelectTransport',
//                 //               arguments: SelectTransport(hubId: hubs[i].id),
//                 //             );
//                 //           },
//                 //         ),
//                 //         width: 80,
//                 //         height: 80));
//                 //   }
//                 // }
//                 // markers:List.generate(stateTwo.data.length, (index) {
//                 // if (userLocation != null){

//                 //   Marker(
//                 //     point:
//                 //         LatLng(userLocation.latitude, userLocation.longitude),
//                 //     child: Icon(Icons.location_pin,
//                 //         color: Colors.blue, size: 50),
//                 //   ),}
//                 // if (hubsAsyncValue is AsyncData &&
//                 //     hubsAsyncValue.value is ListOf)
//                 //   ...hubsAsyncValue.value.resutlAsList.map((hub) => Marker(
//                 //         point: LatLng(hub.latitude, hub.longitude),
//                 //         child: Icon(Icons.location_pin,
//                 //             color: Colors.red, size: 50),
//                 //       )),
//                 // ],
//               ],
//             ),
//             Positioned(
//               bottom: 20,
//               right: 20,
//               child: FloatingActionButton(
//                 backgroundColor: ColorsManager.bg_buttonColor_backgroundColor,
//                 onPressed: () async {
//                   Position position = await Geolocator.getCurrentPosition(
//                       desiredAccuracy: LocationAccuracy.high);
//                   ref.read(userLocationProvider.notifier).state = position;
//                 },
//                 child: Icon(Icons.my_location),
//               ),
//             ),
//           ],
//         );
//       }, error: (Object error, StackTrace stackTrace) {
//         return Text("An error occurred: ${error.toString()}",
//             style: TextStyle(color: Colors.red));
//       }, loading: () {
//         return Center(child: CircularProgressIndicator());
//       }),
//     );
//   }
// }
// ==============================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/config/handling_model.dart';
import '../../../core/resources/colors.dart';
import '../../feature_transport/view/SelectTransport.dart';
import '../model/UserLocationModel.dart';
import '../provider/map_provider.dart';

// final userLocationProvider = StateProvider<UserLocationModel?>((ref) => null);

// class MapScreen extends ConsumerWidget {
//   MapScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     late Position currentPosition;

//     final userLocation = ref.watch(userLocationProvider);
//     final hubsAsyncValue = userLocation != null
//         ? ref.watch(map_provider_getHubs(userLocation))
//         : const AsyncValue.loading();

//     return Scaffold(
//       body: hubsAsyncValue.when(
//         data: (data) {
//           return Stack(
//             children: [
//               FlutterMap(
//                 options: MapOptions(
//                   initialCenter: userLocation != null
//                       ? LatLng(userLocation.latitude, userLocation.longitude)
//                       : LatLng(33.510414, 36.278336),
//                   initialZoom: 13.0,
//                 ),
//                 children: [
//                   TileLayer(
//                     urlTemplate:
//                         'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//                     userAgentPackageName: 'com.example.app',
//                   ),
//                   MarkerLayer(
//                     markers: List.generate(
//                       (data as DataSuccess).data.resutlAsList.length,
//                       (index) {
//                         return Marker(
//                           point: LatLng(
//                             data.data.resutlAsList[index].latitude,
//                             data.data.resutlAsList[index].longitude,
//                           ),
//                           child: IconButton(
//                             icon: const Icon(
//                               Icons.location_on,
//                               color: Colors.red,
//                               size: 40,
//                             ),
//                             onPressed: () {
//                               Navigator.pushNamed(
//                                 context,
//                                 '/SelectTransport',
//                                 arguments: SelectTransport(
//                                   hubId: data.data.resutlAsList[index].id,
//                                 ),
//                               );
//                             },
//                           ),
//                           width: 80,
//                           height: 80,
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               Positioned(
//                 bottom: 20,
//                 right: 20,
//                 child: FloatingActionButton(
//                   backgroundColor: ColorsManager.bg_buttonColor_backgroundColor,
//                   onPressed: () async {
//                     Position position = await Geolocator.getCurrentPosition(
//                         desiredAccuracy: LocationAccuracy.high);
//                     setState(() {
//                       currentPosition = position;
//                     });
//                     // Position position = await Geolocator.getCurrentPosition(
//                     //     desiredAccuracy: LocationAccuracy.high);
//                     ref.read(userLocationProvider.notifier).state =
//                         UserLocationModel(
//                       latitude: position.latitude,
//                       longitude: position.longitude,
//                     );
//                   },
//                   child: Icon(Icons.my_location),
//                 ),
//               ),
//             ],
//           );
//         },
//         error: (Object error, StackTrace stackTrace) {
//           return Text(
//             "An error occurred: ${error.toString()}",
//             style: TextStyle(color: Colors.red),
//           );
//         },
//         loading: () {
//           return Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// }

final userLocationProvider = StateProvider<UserLocationModel?>((ref) => null);

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  late Position currentPosition;
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    ref.read(userLocationProvider.notifier).state = UserLocationModel(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }

  @override
  Widget build(BuildContext context) {
    final userLocation = ref.watch(userLocationProvider);
    if (userLocation == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      body: ref.watch(map_provider_getHubs(userLocation)).when(
        data: (data) {
          return Stack(
            children: [
              FlutterMap(
                options: MapOptions(
                  initialCenter:
                      LatLng(userLocation.latitude, userLocation.longitude),
                  initialZoom: 13.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: List.generate(
                      (data as ListOf).resutlAsList.length,
                      (index) {
                        return Marker(
                          point: LatLng(
                            data.resutlAsList[index].latitude,
                            data.resutlAsList[index].longitude,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.location_on,
                              color: Colors.red,
                              size: 40,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/SelectTransport',
                                arguments: SelectTransport(
                                  hubId: data.resutlAsList[index].id,
                                ),
                              );
                            },
                          ),
                          width: 80,
                          height: 80,
                        );
                      },
                    ),
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(
                            userLocation.latitude, userLocation.longitude),
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.blue,
                          size: 40,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: FloatingActionButton(
                  backgroundColor: ColorsManager.bg_buttonColor_backgroundColor,
                  onPressed: () async {
                    try {
                      // Position position = await Geolocator.getCurrentPosition(
                      //     desiredAccuracy: LocationAccuracy.high);
                      // ref.read(userLocationProvider.notifier).state =
                      //     UserLocationModel(
                      //   latitude: position.latitude,
                      //   longitude: position.longitude,
                      // );
                      Position position = await Geolocator.getCurrentPosition(
                          desiredAccuracy: LocationAccuracy.bestForNavigation);
                      ref.read(userLocationProvider.notifier).state =
                          UserLocationModel(
                        latitude: position.latitude,
                        longitude: position.longitude,
                      );
                    } catch (e) {
                      print("Error getting location: $e");
                    }
                  },
                  child: Icon(Icons.my_location),
                ),
              ),
            ],
          );
        },
        error: (Object error, StackTrace stackTrace) {
          return Center(
            child: Text(
              "An error occurred: ${error.toString()}",
              style: TextStyle(color: Colors.red),
            ),
          );
        },
        loading: () {
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
