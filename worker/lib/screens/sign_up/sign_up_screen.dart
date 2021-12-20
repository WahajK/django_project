import 'package:flutter/material.dart';

import 'components/body.dart';
import 'package:worker/size_config.dart';

class SignUpScreen extends StatelessWidget {
  //static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Body(),
    );
  }
}
