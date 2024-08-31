import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_project/features/feature_authentication/view/welcome.dart';
import 'package:ride_project/features/feature_map/view/map.dart';
import 'package:ride_project/features/feature_onbording/onbording.dart';
import 'package:ride_project/responsive/view/desktopScaffold.dart';
import 'package:ride_project/responsive/view/mobileScaffold.dart';
import 'package:ride_project/responsive/view/tabletScaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/config/bloc_observe_config.dart';
import 'core/config/get_it_config.dart';
import 'core/config/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/feature_authentication/view/signup.dart';
import 'responsive/responsive_layout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  Bloc.observer = MyBlocObserver();
  print(core.get<SharedPreferences>().getString('token'));
  // final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  // Hive.init(appDocumentDirectory.path);
  // Hive.registerAdapter(AuthenticationTokenAdapter());
  // await Hive.openBox<AuthenticationToken>('authBox');
  // await setup();

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      home: MapScreen(),
      // responsive_loyout(
      //   mobilescaffold: mobileScaffold(),
      //   desktposcaffold: desktopScaffold(),
      //   tabletscaffold: tabletScaffold(),
      // ),
      // home: (core.get<SharedPreferences>().getString('token') == null)
      //     ? OnboardingScreen()
      //     : MapScreen(),
    );
  }
}
