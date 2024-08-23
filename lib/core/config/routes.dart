import 'package:flutter/material.dart';

import '../../featureOne/onbording.dart';
import '../../featureThree/view/map.dart';
import '../../featureTow/view/createpassword.dart';
import '../../featureTow/view/signup.dart';
import '../../featureTow/view/welcome.dart';
import '../../featurefour/view/SelectTransport.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(settings, OnboardingScreen());

      case '/SignUp':
        return _materialRoute(settings, SignUpPage());
      case '/WelcomePage':
        return _materialRoute(settings, WelcomePage());

      case '/CreatePassword':
        final args = settings.arguments as CreatePassword;
        return _materialRoute(
            settings,
            CreatePassword(
              fitrstName: args.fitrstName,
              lastName: args.lastName,
              phone: args.phone,
              username: args.username,
              birthDate: args.birthDate,
            ));
      case '/SelectTransport':
        final args = settings.arguments as SelectTransport;
        return _materialRoute(
            settings,
            SelectTransport(
              hubId: args.hubId,
            ));
      case '/MapScreen':
        return _materialRoute(settings, MapScreen());

      default:
        return _materialRoute(settings, OnboardingScreen());
    }
  }

  static Route<dynamic> _materialRoute(RouteSettings settings, Widget view) {
    return MaterialPageRoute(settings: settings, builder: (_) => view);
  }
}
