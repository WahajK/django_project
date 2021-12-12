import 'package:flutter/material.dart';
import 'package:untitled/screens/profile_screen.dart';
import 'package:untitled/screens/search/search_screen.dart';
import 'package:untitled/screens/status.dart';
import 'package:untitled/setting_page/setting_screen.dart';
class DefaultScreen extends StatelessWidget {
  const DefaultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:  search(),
    );
  }
}
class DefaultScreen1 extends StatelessWidget {
  const DefaultScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  editprofile(),
    );
  }
}

class DefaultScreen2 extends StatelessWidget {
  const DefaultScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  TabBarDemo(),
    );
  }
}
