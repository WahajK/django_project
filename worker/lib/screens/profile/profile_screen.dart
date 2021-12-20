import 'package:flutter/material.dart';
//import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:worker/enums.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
 // static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Profile"),
      ),
      body: Body(),
    );
  }
}
