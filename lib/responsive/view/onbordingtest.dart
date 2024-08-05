// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyProgressButton(),
//     );
//   }
// }

// class MyProgressButton extends StatefulWidget {
//   @override
//   _MyProgressButtonState createState() => _MyProgressButtonState();
// }

// class _MyProgressButtonState extends State<MyProgressButton> {
//   int pageIndex = 0;
//   double progressValue = 0.0;

//   void updateProgress() {
//     setState(() {
//       pageIndex++;
//       progressValue += 1.0; // قيمة الزيادة المعينة
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Circle Progress Indicator Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Increment Value: $progressValue'),
//             SizedBox(height: 20),
//             CircularProgressIndicator(
//               value: progressValue / 100, // تحويل القيمة إلى نسبة بين 0 و 1
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 updateProgress();
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) {
//                     if (pageIndex == 0) {
//                       return PageOne();
//                     } else if (pageIndex == 1) {
//                       return PageTwo();
//                     } else {
//                       return PageThree();
//                     }
//                   }),
//                 );
//               },
//               child: Text('Go to Next Page'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PageOne extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Page One'),
//       ),
//     );
//   }
// }

// class PageTwo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Page Two'),
//       ),
//     );
//   }
// }

// class PageThree extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Page Three'),
//       ),
//     );
//   }
// }
