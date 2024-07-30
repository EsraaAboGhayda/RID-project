import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

int index=2;
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    final  pagesOneApp = [
      AppWidegt(image: 'assets/images/Frame 1.png', FirstText: "Anywhere you are", SecondText: "Sell houses easily with the help of Listenoryx and to make this line big \n I am writing more."),
      AppWidegt(image: 'images/Finances2.png', FirstText: "We Warn You", SecondText: "We warn you whether to put your \nmoney on certain companies or \nnot because we care for you."),
      AppWidegt(image: 'images/Finances3.png', FirstText: "Broker Relationship", SecondText: "Our brokers are good, nice and \nfriendly. We bet you, you feel \nhappy after meeting your broker.")
    ];
    final pagesTwoApp = [
      AppWidegt(image: 'images/Finances21.png', FirstText: "Friendly Broker", SecondText: "Friendly broker is a must have if \nyou want to be successful in your \nfinancial life."),
      AppWidegt(image: 'images/Finances22.png', FirstText: "Great Analytics", SecondText: "Amazing analytics for you to \nkeep track of your stocks, expenses, \nsavings and your currencies."),
      AppWidegt(image: 'images/Finances23.png', FirstText: "Compare Stocks", SecondText: "Compare your stocks easily with \nthe help of the free buil-in \ncompare feature in the app.")
    ];
    final pagesThreeApp = [
      AppWidegt(image: 'images/Work From Home31.png', FirstText: "Play Anywhere", SecondText: "The video call feature can be \naccessed from anywhere in your \nhouse to help you."),
      AppWidegt(image: 'images/Work From Home32.png', FirstText: "Stay Healthy", SecondText: "Nobody likes to be alone and the \nbuilt-in group video call feature \nhelps you connect."),
      AppWidegt(image: 'images/Work From Home33.png', FirstText: "Make Connections", SecondText: "While working the app reminds \nyou to smile, laugh, walk and talk \nwith those who matters.")
    ];
    final pagesFourApp = [
      AppWidegt(image: 'images/Work From Home41.png', FirstText: "Access Anywhere", SecondText: "The video call feature can be \naccessed from anywhere in your \nhouse to help you."),
      AppWidegt(image: 'images/Work From Home42.png', FirstText: "Don’t Feel Alone", SecondText: "Nobody likes to be alone and the \nbuilt-in group video call feature \nhelps you connect."),
      AppWidegt(image: 'images/Work From Home43.png', FirstText: "Happiness", SecondText: "While working the app reminds \nyou to smile, laugh, walk and talk \nwith those who matters.")
    ];
    final pagesFiveApp = [
      AppWidegt(image: 'images/Watermelon51.png', FirstText: "Access Anywhere", SecondText: "The video call feature can be \naccessed from anywhere in your \nhouse to help you."),
      AppWidegt(image: 'images/Watermelon52.png', FirstText: "Don’t Feel Alone", SecondText: "Nobody likes to be alone and the \nbuilt-in group video call feature \nhelps you connect."),
      AppWidegt(image: 'images/Watermelon53.png', FirstText: "Happiness", SecondText: "While working the app reminds \nyou to smile, laugh, walk and talk \nwith those who matters.")
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30),
            SizedBox(
              height: 640,
              child: PageView.builder(
                controller: controller,
                itemBuilder: (_, indexx) {
                  if(index==1){
                    return pagesOneApp[indexx % pagesOneApp.length];
                  }else if(index==2){
                    return pagesTwoApp[indexx % pagesTwoApp.length];
                  }else if(index==3){
                    return pagesThreeApp[indexx % pagesThreeApp.length];
                  }else if(index==4){
                    return pagesFourApp[indexx % pagesFourApp.length];
                  }else if(index==5){
                    return pagesFiveApp[indexx % pagesFiveApp.length];
                  }
                },
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count:(index==1)?pagesOneApp.length:0,
             // :(index==2)?pagesTwoApp.length:(index==3)?pagesThreeApp.length:(index==4)?pagesFourApp.length:(index==5)?pagesFiveApp.length:0,
              effect:  WormEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor:(index==1)?Color(0xFF87B8B5):(index==2)?Color(0xFFDD6140):(index==3)?Color(0xFF4756DF):(index==4)?Color(0xFFFF7235):(index==5)?Color(0xFFFE697D):Color(0xFFFFFFFF),
                dotColor:(index==1)?Color(0xFFADD2CF):(index==2)?Color(0xFFEDA997):(index==3)?Color(0xFFB9BFF3):(index==4)?Color(0xFFFFCAB3):(index==5)?Color(0xFFFFCCD3):Color(0xFFFFFFFF),
                type: WormType.underground,
              ),
            ),
            SizedBox(height: 80,),
            Container(
              decoration: BoxDecoration(
                  color:(index==1)?Color(0xFF87B8B5):(index==2)?Color(0xFFDD6140):(index==3)?Color(0xFF4756DF):(index==4)?Color(0xFFFF7235):(index==5)?Color(0xFFFE697D):Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(15)
              ),
              width: 200,
              height: 54,
              child: Center(child: Text('Get Started',style: TextStyle(fontSize: 21,color: Colors.white),)),
            ),
            ListTile(
              title: Text('hhhhhhhh'),
              leading: Icon(Icons.add),
            )

          ],
        ),
      ),
    );
  }

}

class AppWidegt extends StatelessWidget {
  AppWidegt({required this.image,required this.FirstText,required this.SecondText,});
  String image;
  String FirstText;
  String SecondText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset("images/Frame 1.png"),
        Image.asset(image),
        Column(
          children: [
            Text(FirstText,textAlign: TextAlign.center,style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Color(0xFF262626)),),
            SizedBox(height: 15,),
            Text(SecondText,textAlign: TextAlign.center,style: TextStyle(fontSize: 17,color: Color(0xFFA6A6A6)),),
          ],
        )
      ],
    );
  }
}
