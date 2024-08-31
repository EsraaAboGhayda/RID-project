// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../core/config/handling_model.dart';
// import '../model/bicycle_category.dart';
// import '../provider/transport_provider.dart';

// class SelectTransport extends ConsumerWidget {
//   SelectTransport({super.key});

//   @override
//   Widget build(BuildContext context, ref) {
//     final watch = ref.watch(Transport_provider_GetBicycleCategory);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Select Transport'),
//       ),
//       body: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("Select your Transport",
//                   style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))
//             ],
//           ),
//           watch.when(data: (data) {

//             return AspectRatio(
//               aspectRatio: 1,
//               child: SizedBox(
//                 width: double.infinity,
//                 child: GridView.builder(
//                   itemCount: (data as ListOf<BicycleCategoryModel>)
//                       .resutlAsList
//                       .length,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2),
//                   itemBuilder: (context, index) {
//                     return Column(
//                       children: [
//                         Image.asset("assets/images/Cycle.png"),
//                         Text(data.resutlAsList[index].body as String),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//             );
//           }, error: (Object error, StackTrace stackTrace) {
//             if (error is ExceptionModel) {
//               return Text('ExceptionModel${error.message}',
//                   style: TextStyle(color: Colors.red));
//             } else if (error is ErrorModel) {
//               return Text('ErrorModel${error.message}',
//                   style: TextStyle(color: Colors.red));
//             } else {
//               return Text("No internet", style: TextStyle(color: Colors.red));
//             }
//           }, loading: () {
//             return Center(child: CircularProgressIndicator());
//           })
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ride_project/features/feature_transport/view/HubContent.dart';

import '../../../core/config/handling_model.dart';
import '../provider/transport_provider.dart';
import 'SelectAvaialbleTransport.dart';

class SelectTransport extends ConsumerWidget {
  SelectTransport({
    super.key,
    required this.hubId,
  });
  int hubId;
  @override
  Widget build(BuildContext context, ref) {
    final watch = ref.watch(Transport_provider_GetBicycleCategory);
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Transport'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Select your Transport",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
            ],
          ),
          watch.when(
            data: (data) {
              if (data is ListOf) {
                final categories = data.resutlAsList;
                return Expanded(
                  child: GridView.builder(
                    itemCount: categories.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/SelectAvaialbleTransport',
                                arguments: SelectAvaialbleTransport(
                                  namecategory: categories[index],
                                  hubId: hubId,
                                ));
                            print("${categories[index]}");
                          },
                          child: Container(
                            width: 50,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.lightGreen[100],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(image: AssetImage("images/Cycle.png")),
                                // Image.asset("assets/images/Cycle.png"),
                                Text(categories[index]),
                                // Text(data.resutlAsList[index])
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (data is ExceptionModel) {
                return Text('ExceptionModel: ${data.message}',
                    style: TextStyle(color: Colors.red));
              } else if (data is ErrorModel) {
                return Text('ErrorModel: ${data.message}',
                    style: TextStyle(color: Colors.red));
              } else {
                return Text("Unexpected data type",
                    style: TextStyle(color: Colors.red));
              }
            },
            error: (Object error, StackTrace stackTrace) {
              return Text("An error occurred: ${error.toString()}",
                  style: TextStyle(color: Colors.red));
            },
            loading: () {
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
