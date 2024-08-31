import 'package:flutter/material.dart';

import '../../features/feature_onbording/onbording.dart';
import '../../features/feature_map/view/map.dart';
import '../../features/feature_authentication/view/createpassword.dart';
import '../../features/feature_authentication/view/signup.dart';
import '../../features/feature_authentication/view/welcome.dart';
import '../../features/feature_transport/view/HubContent.dart';
import '../../features/feature_transport/view/SelectAvaialbleTransport.dart';
import '../../features/feature_transport/view/SelectTransport.dart';
import '../../features/feature_transport/view/detilesTransport.dart';

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
      case '/MapScreen':
        return _materialRoute(settings, MapScreen());
      case '/SelectTransport':
        final args = settings.arguments as SelectTransport;
        return _materialRoute(settings, SelectTransport(hubId: args.hubId));
      case '/SelectAvaialbleTransport':
        final args = settings.arguments as SelectAvaialbleTransport;
        return _materialRoute(
            settings,
            SelectAvaialbleTransport(
                namecategory: args.namecategory, hubId: args.hubId));
      case '/HubContent':
        final args = settings.arguments as HubContent;
        return _materialRoute(settings,
            HubContent(namecategory: args.namecategory, hubId: args.hubId));
      case '/detilesTransport':
        return _materialRoute(settings, detilesTransport());
      default:
        return _materialRoute(settings, OnboardingScreen());
    }
  }

  static Route<dynamic> _materialRoute(RouteSettings settings, Widget view) {
    return MaterialPageRoute(settings: settings, builder: (_) => view);
  }
}
