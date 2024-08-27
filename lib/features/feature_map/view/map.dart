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
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/config/handling_model.dart';
import '../../../core/resources/colors.dart';
import '../model/UserLocationModel.dart';
import '../provider/map_provider.dart';

final userLocationProvider = StateProvider<Position?>((ref) => null);

class MapScreen extends ConsumerWidget {
  MapScreen({
    super.key,
    required this.type,
  });
  String type;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLocation = ref.watch(userLocationProvider);

    final hubsAsyncValue = userLocation != null
        ? ref.watch(map_provider_getHubs(UserLocationModel(
            latitude: userLocation.latitude,
            longitude: userLocation.longitude)))
        : AsyncValue.loading();

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Map Screen'),
      // ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: userLocation != null
                  ? LatLng(userLocation.latitude, userLocation.longitude)
                  : LatLng(33.510414, 36.278336),
              initialZoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  if (userLocation != null)
                    Marker(
                      point:
                          LatLng(userLocation.latitude, userLocation.longitude),
                      child: Icon(Icons.location_pin,
                          color: Colors.blue, size: 50),
                    ),
                  if (hubsAsyncValue is AsyncData &&
                      hubsAsyncValue.value is ListOf)
                    ...hubsAsyncValue.value.resutlAsList.map((hub) => Marker(
                          point: LatLng(hub.latitude, hub.longitude),
                          child: Icon(Icons.location_pin,
                              color: Colors.red, size: 50),
                        )),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: ColorsManager.bg_buttonColor_backgroundColor,
              onPressed: () async {
                Position position = await Geolocator.getCurrentPosition(
                    desiredAccuracy: LocationAccuracy.high);
                ref.read(userLocationProvider.notifier).state = position;
              },
              child: Icon(Icons.my_location),
            ),
          ),
        ],
      ),
    );
  }
}
