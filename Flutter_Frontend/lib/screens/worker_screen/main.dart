import 'package:untitled/screens/worker_screen//widget/button_widget.dart';
import 'package:untitled/screens/worker_screen//widget/date_picker_widget.dart';
import 'package:untitled/screens/worker_screen//widget/date_range_picker_widget.dart';
import 'package:untitled/screens/worker_screen//widget/datetime_picker_widget.dart';
import 'package:untitled/screens/worker_screen//widget/time_picker_widget.dart';
import 'package:untitled/screens/worker_screen//workerdetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/screens/worker_screen//request.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(AppointmentApp());
}
class AppointmentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Color(0xff2B7EFF),
        primaryColor: Colors.white,
      ),
      home: workerdetail(),
      debugShowCheckedModeBanner: false,
    );
  }
}
