import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/config/handling_model.dart';
import '../provider/transport_provider.dart';
import 'SelectTransport.dart';

// ignore: must_be_immutable
class HubContent extends ConsumerWidget {
  HubContent({super.key, required this.namecategory, required this.hubId});

  String namecategory;
  int hubId;
  @override
  Widget build(BuildContext context, ref) {
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
              'Available Bicycles in hub',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 4),
            // SizedBox(height: 16),
            ref
                .watch(map_provider_GetHubContent(
                    HubCategoryParams(namecategory, hubId)))
                .when(data: (data) {
              return
                  // Expanded(
                  // child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.max,
                  // children: [
                  // Text(
                  //   "${(data as DataSuccess).data.body.bicycleList.length.toString()}  Bicycle found",
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                  Expanded(
                child: ListView.builder(
                  physics:
                      ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  scrollDirection: Axis.vertical,
                  itemCount: (data as DataSuccess).data.body.bicycleList.length,
                  itemBuilder: (context, index) {
                    print(
                        "${((data.data.body.bicycleList[index].type) ?? "")}");
                    print(
                        "${((data.data.body.bicycleList![index].modelPrice!.price.toString()) ?? "")}");
                    print(
                        "${((data.data.body.bicycleList[index].type) ?? "")}");
                    return BicycleItem(
                      type: ((data.data.body.bicycleList[index].type) ?? ""),
                      note: ((data.data.body.bicycleList[index].note) ?? ""),
                      price: ((data
                          .data.body.bicycleList![index].modelPrice!.price
                          .toString())),
                      model: ((data
                              .data.body.bicycleList[index].modelPrice.model) ??
                          ""),
                      size: ((data.data.body.bicycleList![index].size
                          .toString())),
                      photoId: ((data.data.body.bicycleList?[index].photoId
                              .toString()) ??
                          ""),
                      onTap: () {
                        Navigator.pushNamed(context, '/detilesTransport');
                      },
                    );
                  },
                ),
              );
              // ],
              // ),
              // );
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
  final String? price;
  final String? size;
  final String? model;
  final String? note;
  final String? photoId;
  final VoidCallback? onTap;

  BicycleItem({
    this.type,
    this.price,
    this.size,
    this.model,
    this.note,
    this.photoId,
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
                          Text("    |     ",
                              style: TextStyle(color: Colors.grey)),
                          Text("photoId: ${photoId ?? ""}",
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(note ?? ""),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                // Image.network("https://" + photoPath!, height: 80, width: 80),
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
              child: Text('details transport'),
            ),
          ],
        ),
      ),
    );
  }
}
