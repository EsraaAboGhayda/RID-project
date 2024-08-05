import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/config/bloc_observe_config.dart';
import 'core/config/get_it_config.dart';
import 'responsive/view/login_page.dart';
import 'responsive/view/onbording.dart';
import 'responsive/view/singup_page.dart';

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

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: singup_page(),
      //  responsive_loyout(
      //   mobilescaffold: mobileScaffold(),
      //   desktposcaffold: desktopScaffold(),
      //   tabletscaffold: tabletScaffold(),
      // ),
      home: (core.get<SharedPreferences>().getString('token') == null)
          ? singup_page()
          // responsive_loyout(
          //     mobilescaffold: mobileScaffold(),
          //     desktposcaffold: desktopScaffold(),
          //     tabletscaffold: tabletScaffold(),
          //   )
          : login_page(),
    );
  }
}
