import 'package:flutter/material.dart';
import 'package:worker/screens/complete_profile/components/profile_widget.dart';
import 'profile_menu.dart';
import 'package:worker/screens/profile/components/notification.dart';
import 'package:worker/user.dart';
import 'package:worker/userpref.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:worker/constants.dart';
import 'package:path/path.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'profile_pic.dart';
import 'dart:io';
class Body extends StatefulWidget {
  @override
  Body1 createState() => Body1();
}

class Body1 extends State<Body> {
  late User user;
  void initState() {
    super.initState();

    user = UserPreferences.getUser();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 28, right: 28, top: 16, bottom: 8),
      child: Center(
        child: Column(
         // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
            children: [
            SizedBox(width: 40,),
              Text(
                  "Profile",
                  style: TextStyle(
                    color: kIndigoDark,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(width: 10,),
                  SvgPicture.asset(
              "assets/icons/User Icon.svg",
              color: kPrimaryColor,
              width: 22,
              height: 22,
            ),
            ],
          ),
            SizedBox(height: 15,),
            Center(
              child: Stack(
                children: [
                  ProfileWidget(
                    imagePath: user.imagePath,
                    isEdit: true,
                    onClicked: () async {
                      final image = await ImagePicker()
                          .getImage(source: ImageSource.gallery);

                      if (image == null) return;

                      final directory = await getApplicationDocumentsDirectory();
                      final name = basename(image.path);
                      final imageFile = File('${directory.path}/$name');
                      final newImage =
                      await File(image.path).copy(imageFile.path);

                      setState(() => user = user.copy(imagePath: newImage.path));
                    },
                  ),

                ],
              ),
            ),
            SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
              press: () {}

            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              press: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => settingpage()));
              },
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/icons/Settings.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "assets/icons/Question mark.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
