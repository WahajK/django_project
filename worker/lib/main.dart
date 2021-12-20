import 'package:flutter/material.dart';
import 'package:worker/screens/sign_up/sign_up_screen.dart';
// import 'package:shop_app/routes.dart';
// import 'package:shop_app/screens/profile/profile_screen.dart';
// import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:worker/theme.dart';
import 'package:worker/screens/signin/sign_in_screen.dart';
import 'package:worker/userpref.dart';
import 'package:flutter/services.dart';
import 'package:worker/size_config.dart';
import 'package:worker/screens/complete_profile/complete_profile_screen.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await UserPreferences.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
 // SizeConfig().init(context);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),

      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
     home:
     SignInScreen(),
    );
  }
}
