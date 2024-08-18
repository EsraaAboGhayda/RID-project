import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/config/bloc_observe_config.dart';
import 'core/config/get_it_config.dart';
import 'core/config/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'featureTow/view/signup.dart';

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
      home: SignUpPage(),
      // responsive_loyout(
      //   mobilescaffold: mobileScaffold(),
      //   desktposcaffold: desktopScaffold(),
      //   tabletscaffold: tabletScaffold(),
      // ),
      // home: (core.get<SharedPreferences>().getString('token') == null)
      // ? SignUpPage()
      // responsive_loyout(
      //     mobilescaffold: mobileScaffold(),
      //     desktposcaffold: desktopScaffold(),
      //     tabletscaffold: tabletScaffold(),
      //   )
      // : WelcomePage(),
    );
  }
}
