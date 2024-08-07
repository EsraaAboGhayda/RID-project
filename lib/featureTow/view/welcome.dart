import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_project/core/resources/assets.dart';
import 'package:ride_project/core/resources/colors.dart';
import 'package:ride_project/core/resources/string.dart';
import 'package:ride_project/core/widgets/app_Button.dart';
import 'package:ride_project/featureTow/bloc/authe_bloc.dart';
import 'package:ride_project/featureTow/view/signup.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AutheBloc(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                AssetsManager.onboarding_welcome,
                height: 276,
                width: 356,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      StringsManager.welcometxt,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    StringsManager.welcometxt_second,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 50),
                  PublicButton(
                    text: StringsManager.createaccount,
                    color: ColorsManager.bg_buttonColor_backgroundColor,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      //fontWeight: FontWeight.bold,
                    ),
                    width: 340.0,
                    height: 54.0,
                    borderRadius: 8.0,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                  ),
                  SizedBox(height: 15),
                  PublicButton(
                    text: StringsManager.login,
                    color: ColorsManager.bg_buttonColor_secondary,
                    textStyle: TextStyle(
                      color: ColorsManager.txt_buttonColor_secondary,
                      fontSize: 16.0,
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
                  SizedBox(height: 50),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
