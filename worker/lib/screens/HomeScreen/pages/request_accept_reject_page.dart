import 'package:flutter/material.dart';
import 'package:worker/components/default_button.dart';
import 'package:worker/home_page.dart';
//import 'package:worker/screens/home/home_screen.dart';
import 'package:worker/size_config.dart';


class Body extends StatelessWidget {
  const Body({
    Key? key,
    this.name,
    this.temp
  }) : super(key: key);

  final String? name;
  final bool? temp;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Image.asset(
            "assets/images/success.png",
            height: SizeConfig.screenHeight * 0.4, //40%
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.08),
          Text(
            name!,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: DefaultButton(
              text: "Back to home",
              press: () {

                 Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Home()));
              },
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}