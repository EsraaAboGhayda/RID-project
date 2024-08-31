// // // import 'package:flutter/material.dart';

// // // class SelectAvaialbleTransport extends StatelessWidget {
// // //    SelectAvaialbleTransport({super.key,required this.NameCategory,});
// // //   String NameCategory;
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold();
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';

// // import '../../../core/config/handling_model.dart';
// // import '../../feature_map/view/map.dart';
// // import '../model/bicycle_by_category.dart';
// // import '../model/bicycle_category.dart';
// // import '../provider/transport_provider.dart';
// // import 'SelectTransport.dart';

// // class SelectAvaialbleTransport extends ConsumerWidget {
// //   SelectAvaialbleTransport({
// //     super.key,
// //     required this.namecategory,
// //   });
// //   String namecategory;
// //   @override
// //   Widget build(BuildContext context, ref) {
// //     final watch = ref.watch(map_provider_GetBicycleByCategory(namecategory));
// //     return Scaffold(
// //       appBar: AppBar(
// //         leading: IconButton(
// //           icon: Icon(Icons.arrow_back),
// //           onPressed: () {
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(builder: (context) => SelectTransport()),
// //             );
// //           },
// //         ),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(
// //               'Available Cars',
// //               style: TextStyle(
// //                 fontSize: 20,
// //                 fontWeight: FontWeight.bold,
// //                 color: Colors.black,
// //               ),
// //             ),
// //             SizedBox(height: 4),
// //             Text(
// //               '18 cars found',
// //               style: TextStyle(
// //                 fontSize: 16,
// //                 color: Colors.grey,
// //               ),
// //             ),
// //             SizedBox(height: 16),
// //             watch.when(data: (data) {
// //               final bycategories = data as ListOf<BicycleByCategoryModel>;
// //               return Expanded(
// //                 child: ListView.builder(
// //                   itemCount: bycategories.resutlAsList.length,
// //                   itemBuilder: (context, index) {
// //                     return BicycleItem(
// //                       type: bycategories.resutlAsList[index].body[index].type,
// //                       price: bycategories
// //                           .resutlAsList[index].body[index].modelPrice.price,
// //                       size: bycategories.resutlAsList[index].body[index].size,
// //                       // note: bycategories.resutlAsList[index].body[index].note,
// //                       photoPath: bycategories
// //                           .resutlAsList[index].body[index].photoPath,
// //                       onTap: () {
// //                         Navigator.pushNamed(context, '/MapScreen',
// //                             arguments: MapScreen(
// //                               type: bycategories
// //                                   .resutlAsList[index].body[index].type,
// //                             ));
// //                       },
// //                     );
// //                   },

// //                   // CarItem(
// //                   //   carName: 'Mustang Shelby GT',
// //                   //   carDetails: 'Automatic | 2 seats | Octane',
// //                   //   distance: '800m (5mins away)',
// //                   //   imagePath: 'assets/mustang_shelby.png',
// //                   //   onTap: () {
// //                   //     Navigator.push(
// //                   //       context,
// //                   //       MaterialPageRoute(
// //                   //           builder: (context) =>
// //                   //               CarDetailsScreen(carName: 'Mustang Shelby GT')),
// //                   //     );
// //                   //   },
// //                   // ),
// //                   // CarItem(
// //                   //   carName: 'BMW i8',
// //                   //   carDetails: 'Automatic | 5 seats | Octane',
// //                   //   distance: '800m (5mins away)',
// //                   //   imagePath: 'assets/bmw_i8.png',
// //                   //   onTap: () {
// //                   //     Navigator.push(
// //                   //       context,
// //                   //       MaterialPageRoute(
// //                   //           builder: (context) =>
// //                   //               CarDetailsScreen(carName: 'BMW i8')),
// //                   //     );
// //                   //   },
// //                   // ),
// //                 ),
// //               );
// //             }, error: (Object error, StackTrace stackTrace) {
// //               return Text("An error occurred: ${error.toString()}",
// //                   style: TextStyle(color: Colors.red));
// //             }, loading: () {
// //               return Center(child: CircularProgressIndicator());
// //             })
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class BicycleItem extends StatelessWidget {
// //   final String type;
// //   final double price;
// //   final int size;
// //   final String photoPath;
// //   // final String note;
// //   final VoidCallback onTap;

// //   BicycleItem({
// //     required this.type,
// //     required this.price,
// //     required this.size,
// //     required this.photoPath,
// //     // required this.note,
// //     required this.onTap,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(8.0),
// //       ),
// //       child: Padding(
// //         padding: const EdgeInsets.all(8.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(
// //               children: [
// //                 Expanded(
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(type,
// //                           style: TextStyle(
// //                               fontSize: 18,
// //                               fontWeight: FontWeight.bold,
// //                               color: Colors.black)),
// //                       SizedBox(height: 5),
// //                       Text(
// //                         price as String,
// //                         style: TextStyle(
// //                           color: Colors.grey,
// //                         ),
// //                       ),
// //                       SizedBox(height: 5),
// //                       Text(size as String),
// //                     ],
// //                   ),
// //                 ),
// //                 SizedBox(width: 10),
// //                 Image.asset(photoPath, height: 80, width: 80),
// //               ],
// //             ),
// //             SizedBox(height: 10),
// //             ElevatedButton(
// //               onPressed: onTap,
// //               style: ElevatedButton.styleFrom(
// //                 foregroundColor: Colors.black,
// //                 backgroundColor: Colors.lightGreen[100],
// //                 minimumSize: Size(double.infinity, 36),
// //               ),
// //               child: Text('View car list'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class CarDetailsScreen extends StatelessWidget {
// //   final String carName;

// //   CarDetailsScreen({required this.carName});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text(carName)),
// //       body: Center(
// //         child: Text('Details for $carName'),
// //       ),3
// //     );
// //   }
// // }

// //222222222222 ===========================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ride_project/features/feature_transport/view/HubContent.dart';

import '../../../core/config/handling_model.dart';
import '../../feature_map/view/map.dart';
import '../provider/transport_provider.dart';
import 'SelectTransport.dart';

// ignore: must_be_immutable
class SelectAvaialbleTransport extends ConsumerWidget {
  SelectAvaialbleTransport({
    super.key,
    required this.namecategory,
    required this.hubId,
  });

  String namecategory;
  int hubId;
  @override
  Widget build(BuildContext context, ref) {
    // final BicycleCategoryModel categoryModel = BicycleCategoryModel(body: namecategory);
    print("ffffffffffffffff${namecategory}");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SelectTransport(
                        hubId: hubId,
                      )),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Cars',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 4),
            SizedBox(height: 16),
            ref.watch(map_provider_GetBicycleByCategory(namecategory)).when(
                data: (data) {
              return Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "${(data as DataSuccess).data.body.length.toString()}  Bicycle found",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: ScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        itemCount: (data as DataSuccess).data.body.length,
                        itemBuilder: (context, index) {
                          // final categoryModel = bycategories.resutlAsList[index];
                          // return ListTile(
                          //   title: Text((data.data.body[index].type) ?? ""),
                          //   subtitle: Row(
                          //     children: [
                          //       Text((data.data.body![index].size.toString())),
                          //       Text((data.data.body![index].modelPrice!.price
                          //           .toString())),
                          //       Text(
                          //           (data.data.body?[index].modelPrice!.model) ?? ""),
                          //     ],
                          //   ),
                          //   leading: Image.network(
                          //       "https://" + (data.data.body?[index].photoPath) ??
                          //           ""),
                          // );
                          // if (categoryModel.body is List<Bicycle>) {
                          //   final bike = categoryModel.body?[index];

                          return BicycleItem(
                            type: ((data.data.body[index].type) ?? ""),
                            note: ((data.data.body[index].note) ?? ""),
                            price: ((data.data.body![index].modelPrice!.price
                                .toString())),
                            model: ((data.data.body[index].modelPrice.model) ??
                                ""),
                            size: ((data.data.body![index].size.toString())),
                            photoPath:
                                ((data.data.body?[index].photoPath) ?? ""),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/HubContent',
                                arguments: HubContent(
                                  namecategory: namecategory,
                                  hubId: hubId,
                                ),
                              );
                              print("${namecategory}${hubId}");
                            },
                          );
                          // } else {
                          //   return Text('Unexpected data type for body');
                          // }
                        },
                      ),
                    ),
                  ],
                ),
              );
              // final bycategories = data as ListOf<BicycleByCategoryModel>;
            }, error: (Object error, StackTrace stackTrace) {
              print("${error.toString()}");
              return Text("An error occurred: ${error.toString()}",
                  style: TextStyle(color: Colors.red));
            }, loading: () {
              return Center(child: CircularProgressIndicator());
            })
          ],
        ),
      ),
    );
  }
}

class BicycleItem extends StatelessWidget {
  final String? type;
  // final List? maintenance;
  final String? price;
  final String? size;
  final String? model;
  final String? note;
  final String? photoPath;
  final VoidCallback? onTap;

  BicycleItem({
    this.type,
    // this.maintenance,
    this.price,
    this.size,
    this.model,
    this.note,
    this.photoPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(type ?? "",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text("price: ${price ?? ""}",
                              style: TextStyle(color: Colors.grey)),

                          Text("    |     ",
                              style: TextStyle(color: Colors.grey)),
                          Text("size: ${size ?? ""}",
                              style: TextStyle(color: Colors.grey)),
                          Text("    |     ",
                              style: TextStyle(color: Colors.grey)),
                          Text("model: ${model ?? ""}",
                              style: TextStyle(color: Colors.grey)),
                          // Text(
                          //   "$maintenance",
                          //   style: TextStyle(
                          //     color: Colors.grey,
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(note ?? ""),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                // Image.network(photoPath ?? "", height: 80, width: 80),
                Image.network("https://" + photoPath!, height: 80, width: 80),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.lightGreen[100],
                minimumSize: Size(double.infinity, 36),
              ),
              child: Text('hub content'),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../core/config/handling_model.dart';
// import '../../feature_map/view/map.dart';
// import '../model/bicycle_by_category.dart';
// import '../provider/transport_provider.dart';
// import 'SelectTransport.dart';

// class SelectAvaialbleTransport extends ConsumerWidget {
//   final String namecategory;

//   SelectAvaialbleTransport({
//     Key? key,
//     required this.namecategory,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final watch = ref.watch(map_provider_GetBicycleByCategory(namecategory));

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => SelectTransport()),
//             );
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Available Cars',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//             SizedBox(height: 4),
//             Text(
//               '18 cars found',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey,
//               ),
//             ),
//             SizedBox(height: 16),
//             watch.when(
//               data: (data) {
//                 final byCategories = data as ListOf<BicycleByCategoryModel>;
//                 return Expanded(
//                   child: ListView.builder(
//                     itemCount: byCategories.resutlAsList.length,
//                     itemBuilder: (context, index) {
//                       final bike =
//                           byCategories.resutlAsList[index].body?[index];
//                       if (bike != null) {
//                         return ListTile(
//                           title: Text(bike.type ?? 'Unknown type'),
//                           subtitle: Text(bike.modelPrice?.price.toString() ??
//                               'Price not available'),
//                           leading: bike.photoPath != null
//                               ? Image.asset(bike.photoPath!)
//                               : Icon(Icons.image_not_supported),
//                         );
//                       } else {
//                         return Text('Unexpected data type or null values');
//                       }
//                     },
//                   ),
//                 );
//               },
//               error: (Object error, StackTrace stackTrace) {
//                 return Text("An error occurred: ${error.toString()}",
//                     style: TextStyle(color: Colors.red));
//               },
//               loading: () {
//                 return Center(child: CircularProgressIndicator());
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// =4444444444444444===================================================================


