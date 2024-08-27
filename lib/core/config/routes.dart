import 'package:flutter/material.dart';

import '../../features/feature_onbording/onbording.dart';
import '../../features/feature_map/view/map.dart';
import '../../features/feature_authentication/view/createpassword.dart';
import '../../features/feature_authentication/view/signup.dart';
import '../../features/feature_authentication/view/welcome.dart';
import '../../features/feature_transport/view/SelectAvaialbleTransport.dart';
import '../../features/feature_transport/view/SelectTransport.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(settings, OnboardingScreen());
      case '/WelcomePage':
        return _materialRoute(settings, WelcomePage());

      case '/SignUp':
        return _materialRoute(settings, SignUpPage());

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
        return _materialRoute(settings, SelectTransport());
      case '/SelectAvaialbleTransport':
        final args = settings.arguments as SelectAvaialbleTransport;
        return _materialRoute(settings,
            SelectAvaialbleTransport(namecategory: args.namecategory));
      // case '/HubContent':
      //   final args = settings.arguments as HubContent;
      //   return _materialRoute(settings,
      //       HubContent(NameCategory: args.NameCategory, HubId: args.HubId));
      case '/MapScreen':
        final args = settings.arguments as MapScreen;
        return _materialRoute(settings, MapScreen(type: args.type));

      default:
        return _materialRoute(settings, OnboardingScreen());
    }
  }

  static Route<dynamic> _materialRoute(RouteSettings settings, Widget view) {
    return MaterialPageRoute(settings: settings, builder: (_) => view);
  }
}
