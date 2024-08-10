import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:ride_project/core/resources/assets.dart';
import 'package:ride_project/core/resources/colors.dart';
import 'package:ride_project/core/widgets/app_Button.dart';
import 'package:ride_project/featureThree/model/UserLocationModel.dart';

class MapPage extends StatefulWidget {
  MapPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

// MapController mapController = MapController();
// Future<void> setUserLocationOnMap(User_location_model userLocation) async {
//   var mm = mapController.move(
//       LatLng(userLocation.latitude, userLocation.longtitude), 15.0);
//   print("mm=$mm");
// }

class _MapPageState extends State<MapPage> {
  late MapController mapController;
  late Position currentPosition;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    getLocation();
  }

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentPosition = position;
    });
    var markers = <Marker>[];
    @override
    Widget build(BuildContext context) {
      bool showContainer = false;
      return Scaffold(
          body: Stack(children: [
        FlutterMap(
          // mapController: showContainer;
          options: MapOptions(
            // initialCenter: LatLng(33.510414, 36.278336),
            // initialZoom: 10,
            center: LatLng(currentPosition.latitude, currentPosition.longitude),
            zoom: 13.0,
            controller: mapController,
            onTap: (tapPosition, point) {
              print(point.latitude);
              print(point.longitude);
              markers.add(Marker(
                  point: LatLng(point.latitude, point.longitude),
                  child: Icon(
                    Icons.location_on,
                    color: Colors.red,
                  )));
            },
          ),

          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            // RichAttributionWidget(
            //   popupBackgroundColor: Colors.brown,
            //   attributions: [
            //     TextSourceAttribution(
            //       'OpenStreetMap contributors',
            //     ),
            //   ],
            // ),
            FloatingActionButton(onPressed: () {
              setState(() {
                showContainer = !showContainer;
              });
            }),
            // MarkerLayer(
            //   markers: [
            //     Marker(point: LatLng(latitude, longitude), child: child)
            //   ],
            //   markers: [
            //   Marker(

            //     point: LatLng(33.510414, 36.278336),
            //     child: FlutterLogo(),
            //   )
            // ]
            // )
            //   MarkerLayer(
            //     markers: [
            //       Marker(
            //         width: 80.0,
            //         height: 80.0,
            //         child: const Icon(
            //           Icons.location_on,
            //           color: Colors.red,
            //           size: 40.0,
            //         ), point:
            //       ),
            //     ],
            //   ),
          ],
        ),
        showContainer
            ? Container()
            : Center(
                child: Container(
                  width: 300,
                  height: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetsManager.location,
                        width: 150,
                        height: 150,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: Text(
                        "Enable your location",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "choose your location to start find the \n             request arounded you",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: PublicButton(
                          text: "Use my location",
                          color: ColorsManager.txt_buttonColor_secondary,
                          textStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                          width: 340.0,
                          height: 54.0,
                          borderRadius: 8.0,
                          side: BorderSide(
                            color: ColorsManager.border_buttonColor_secondary,
                            width: 1.0,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(height: 20),
                      InkWell(
                          onTap: () {},
                          child: Center(
                              child: Text("Skip for now",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15))))
                    ],
                  ),
                ),
              )
      ]));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

// ========================================
