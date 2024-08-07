// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:ride_project/core/resources/colors.dart';
// import 'package:ride_project/core/resources/style.dart';
// import 'package:ride_project/feature/bloc/authe_bloc.dart';
// import 'package:ride_project/model/login_model.dart';
// import 'package:ride_project/responsive/view/onbording.dart';

// import 'signup.dart';
// import 'singup_page.dart';

// class login_page extends StatelessWidget {
//   login_page({super.key});
//   final TextEditingController password = TextEditingController();
//   final TextEditingController phone = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AutheBloc(),
//       child: Scaffold(
//         backgroundColor: ColorsManager.bg_buttonColor_backgroundColor,
//         body: Center(
//           child: Container(
//             height: 650,
//             width: 400,
//             child: Column(
//               children: [
//                 Expanded(
//                     child: Stack(
//                   alignment: Alignment.topCenter,
//                   children: [
//                     Center(
//                       child: Container(
//                         width: 290,
//                         height: 350,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             color: Colors.white),
//                         child: Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.all(12),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Spacer(
//                                   flex: 2,
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(left: 20),
//                                   child: Text("EMAIL",
//                                       style: TextStyle(
//                                           fontSize: 15,
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.w100)),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: SizedBox(
//                                     height: 45,
//                                     child: TextField(
//                                       decoration: InputDecoration(
//                                         filled: true,
//                                         fillColor: ColorsManager
//                                             .bg_buttonColor_backgroundColor,
//                                         hintText: "EXAMPLEEMAIL",
//                                         hintStyle: hinttextfild,
//                                         border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(12),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Spacer(
//                                   flex: 1,
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(left: 20),
//                                   child: Text("PASSWORD",
//                                       style: TextStyle(
//                                           fontSize: 15,
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.w100)),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.all(8.0),
//                                   child: SizedBox(
//                                     height: 45,
//                                     child: TextField(
//                                       decoration: InputDecoration(
//                                         filled: true,
//                                         fillColor: ColorsManager
//                                             .bg_buttonColor_backgroundColor,
//                                         // hintStyle: TextStyle(inherit: false),
//                                         border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(12),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 15),
//                                   child: Row(
//                                     children: [
//                                       Container(
//                                         width: 20,
//                                         height: 20,
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(5),
//                                             color: ColorsManager
//                                                 .bg_buttonColor_backgroundColor),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Text("REMEMBERME",
//                                             style: TextStyle(
//                                                 fontSize: 15,
//                                                 color: Colors.black,
//                                                 fontWeight: FontWeight.w100)),
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 15,
//                       child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                                 color: ColorsManager
//                                     .bg_buttonColor_backgroundColor,
//                                 borderRadius: BorderRadius.circular(50)),
//                             width: 100,
//                             height: 100,
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 color: ColorsManager
//                                     .bg_buttonColor_backgroundColor,
//                                 borderRadius: BorderRadius.circular(50)),
//                             width: 90,
//                             height: 90,
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(top: 20),
//                             child: Image.asset(
//                               "images/Intersect.png",
//                               width: 80,
//                               height: 80,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 )),
//                 BlocConsumer<AutheBloc, AutheState>(
//                   listener: (context, state) {
//                     if (state is SuccessToRegister) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => OnboardingScreen(),
//                         ),
//                       );
//                     }
//                   },
//                   builder: (context, state) {
//                     if (state is AutheInitial) {
//                       return InkWell(
//                         onTap: () {
//                           context.read<AutheBloc>().add(
//                                 LogIn(
//                                   user: LoginModel(
//                                     phone: phone.text,
//                                     password: password.text,
//                                   ),
//                                 ),
//                               );
//                         },
//                         child: Container(
//                           width: 290,
//                           height: 55,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               color:
//                                   ColorsManager.bg_buttonColor_backgroundColor),
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 10.0),
//                             child: Text("LOGIN",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Colors.black, fontSize: 25)),
//                           ),
//                         ),
//                       );
//                     } else if (State is Failed) {
//                       return SizedBox(
//                         height: 300,
//                         child: Column(
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 context.read<AutheBloc>().add(
//                                       LogIn(
//                                         user: LoginModel(
//                                           phone: phone.text,
//                                           password: password.text,
//                                         ),
//                                       ),
//                                     );
//                               },
//                               child: Container(
//                                 width: 290,
//                                 height: 55,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(15),
//                                     color: ColorsManager
//                                         .bg_buttonColor_backgroundColor),
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(top: 10.0),
//                                   child: Text("LOGIN",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Colors.black, fontSize: 25)),
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               "error",
//                               style: TextStyle(fontSize: 20, color: Colors.red),
//                             )
//                           ],
//                         ),
//                       );
//                     } else if (state is SuccessToRegister) {
//                       return Container(
//                         width: 290,
//                         height: 55,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             color: Colors.green),
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 10.0),
//                           child: Text("success",
//                               textAlign: TextAlign.center,
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 25)),
//                         ),
//                       );
//                     } else {
//                       return CircularProgressIndicator();
//                     }
//                   },
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Don't have an account ?  ",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => SignUpPage(),
//                             ),
//                           );
//                         },
//                         child: Text(
//                           "SINGUP",
//                           style: TextStyle(
//                               color:
//                                   ColorsManager.bg_buttonColor_backgroundColor),
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
