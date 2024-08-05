import 'package:flutter/material.dart';
import 'package:ride_project/core/resources/assets.dart';
import 'package:ride_project/core/resources/string.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController(initialPage: 0);
  int Index = 0;

  void onPageChanged(int index) {
    setState(() {
      Index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pagesOneApp = [
      AppWidegt(
          image: AssetsManager.onboarding_onepage,
          FirstText: StringsManager.anywhereYouAre,
          SecondText: StringsManager.anywhereYouAre_Second),
      AppWidegt(
          image: AssetsManager.onboarding_secondpage,
          FirstText: StringsManager.anytime,
          SecondText: StringsManager.anytime_Second),
      AppWidegt(
          image: AssetsManager.onboarding_thirdpage,
          FirstText: StringsManager.Bookyourcar,
          SecondText: StringsManager.Bookyourcar_Second),
    ];

    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: onPageChanged,
              children: pagesOneApp,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(constraints.maxHeight * 0.03),
                child: Container(
                  // width: 70,
                  width: constraints.maxHeight * 0.10,

                  height: constraints.maxHeight * 0.10,
                  // height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF08B783),
                  ),
                  child: RawMaterialButton(
                    shape: CircleBorder(),
                    onPressed: () {
                      if (Index < pagesOneApp.length - 1) {
                        pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      } else {
                        //   navigation.navigate('HomeScreen');
                      }
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(
                          value: (Index + 1) / pagesOneApp.length,
                          //  backgroundColor: Color(0xFF08B783),
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                        if (Index < pagesOneApp.length - 1)
                          Container(
                              height: constraints.maxHeight * 0.05,
                              child: Icon(Icons.arrow_forward,
                                  color: Color(0xFF5A5A5A)))
                        else
                          Text('GO',
                              style: TextStyle(
                                  fontSize: constraints.maxHeight * 0.03,
                                  // height: constraints.maxHeight * 0.10,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF5A5A5A))),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppWidegt extends StatelessWidget {
  final String image;
  final String FirstText;
  final String SecondText;

  AppWidegt({
    required this.image,
    required this.FirstText,
    required this.SecondText,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        color: Colors.red,
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.all(constraints.maxHeight * 0.01),
              child: Image.asset(
                image,
                height: constraints.maxHeight * 0.40,
                width: MediaQuery.of(context).size.width * 0.80,
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.01,
              // height: 50
            ),
            Container(
              color: Colors.grey,
              height: constraints.maxHeight * 0.25,
              width: constraints.maxWidth * 0.50,
              child: Column(
                children: [
                  Text(
                    FirstText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: constraints.maxHeight * 0.003,
                      // fontSize: MediaQuery.of(context).(double.parse(Size))* 0.04,
                      // fontSize: 20,
                      fontSize: constraints.maxHeight * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF262626),
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.02,
                    // height: 15
                  ),
                  Text(
                    SecondText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      // fontSize: 15,
                      // height: MediaQuery.of(context).size.height * 0.005,

                      fontSize: constraints.maxHeight * 0.024,
                      color: Color(0xFFA6A6A6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




































// ============================================================================


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import '../../core/resources/color.dart';
// import '../../core/resources/string.dart';

// // PageController onBoardingContoller = PageController();
// double pageIndex = 0.0;
// int count = 0;

// class HomePageState extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         // controller: onBoardingContoller,
//         // onPageChanged: (value) {
//         //   print(value);
//         // },
//         // physics: BouncingScrollPhysics(),
//         // scrollDirection: Axis.horizontal,
//         children: const [
//           OnBoarding(
//               title: "Write Lists",
//               // image: 'assets/images/cuate.png',
//               des: "Aliquip eu sint \nsint ullamco commodo.",
//               index: 0),
//           OnBoarding(
//               title: "Write Lists",
//               // image: 'assets/images/cuate2.png',
//               des: "Ex qui sit in cillum officia.",
//               index: 1),
//           OnBoarding(
//               title: "Write Lists",
//               // image: 'assets/images/cuate3.png',
//               des:
//                   "Nulla nisi consequat fugiat deserunt qui voluptate anim ullamco ad mollit id aliqua cillum.",
//               index: 2),
//           Scaffold(
//             backgroundColor: backgroundColor,
//           )
//         ],
//       ),
//     );
//   }
// }

// class OnBoarding extends StatefulWidget {
//   const OnBoarding(
//       {super.key,
//       this.title,
//       // this.image,
//       this.des,
//       this.index});

//   final String? title;
//   // final String? image;
//   final String? des;
//   final int? index;

//   @override
//   State<OnBoarding> createState() => _OnBoardingState();
// }

// class _OnBoardingState extends State<OnBoarding> {
//   // int pageIndex = 0;

//   // void updateProgress() {
//   //   setState(() {
//   //     pageIndex++;
//   //   });
//   // }
//   // double progress = 0.0;
//   // void increaseProgress() {
//   //   setState(() {
//   //     progress += 0.1;
//   //   });
//   // }

//   void updateProgress() {
//     setState(() {
//       count++;
//       print(" count++${count++}");

//       String pageint = (widget.index).toString();
//       print("pageint${pageint}");
//       pageIndex = double.parse(pageint) + 1.0;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     double progress = pageIndex * 0.1;
//     print("progress${progress}");

//     print("${OnBoarding(index: count + 1)}");

//     count = pageIndex.toInt();
//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(onTap: () {}, child: Text("skip")),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 10.0),
//             child: Align(
//                 alignment: Alignment.topRight,
//                 child: Icon(
//                   Icons.skip_next,
//                 )),
//           ),
//           Container(
//             // decoration: BoxDecoration(shape: BoxShape.circle),
//             // clipBehavior: Clip.hardEdge,
//             width: 300,
//             height: 200,
//             // child: Image.asset(
//             //   widget.image!,
//             // ),
//           ),
//           Text(
//             widget.title!,
//             style: headlineTextStyle,
//           ),
//           Text(
//             widget.des!,
//             style: subtitleTextStyle,
//           ),

//           Stack(
//             children: [
//               CircularProgressIndicator(
//                 strokeWidth: 0.5,
//                 color: Colors.black,
//                 value: progress,
//               ),
//               InkWell(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => OnBoarding(
//                                 index: count + 1,
//                               )));
//                 },
//                 child: Container(
//                   width: 50,
//                   height: 50,
//                   decoration: BoxDecoration(
//                       color: backgroundColor, borderRadius: BorderRadius.circular(50)),
//                 ),
//               )
//             ],
//           ),
//           // SmoothPageIndicator(

//           //     controller: onBoardingContoller, // PageController
//           //     count: 4,
//           //     effect: WormEffect(dotColor: secondary,activeDotColor: backgroundColor), // your preferred effect
//           //     onDotClicked: (index) {}),
//         ],
//       ),
//     );
//   }
// }
