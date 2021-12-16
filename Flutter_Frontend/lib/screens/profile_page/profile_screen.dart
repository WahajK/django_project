import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled/screens/profile_page/profile_widget.dart';
import 'package:untitled/screens/profile_page/user.dart';
import 'package:untitled/screens/profile_page/userpref.dart';
import 'package:untitled/main.dart';
import 'package:untitled/screens/setting_page/setting_screen.dart';

class editprofile extends StatefulWidget {

  @override
  profilepage createState() => profilepage();
}

class profilepage extends State<editprofile> {
  bool showpass = false;
  late User user;
  @override
  void initState() {
    super.initState();

    user = UserPreferences.getUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation:5,
        actions: [ IconButton(icon: const Icon(Icons.settings,color: Colors.blue,), onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>settingpage()));
        },)],
      ),

      body: Container(
        padding: EdgeInsets.only(left: 16, top: 20, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const Text("Edit Profile",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)
              ),
              const SizedBox(height: 10,),
              Center(
                child: Stack(
                  children: [ ProfileWidget(
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
              const SizedBox(height: 30,),
              buildtextfield("User Name", users[0].username,false,false),
              buildtextfield("Full Name", users[0].fname + ' ' + users[0].lname,false,true),
              buildtextfield("Email", users[0].email,false,false),
              buildtextfield("Password", "**********",true,true),
              buildtextfield("Address", users[0].address,false,true ),
              buildtextfield("Phone_No", users[0].contact, false, true),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  OutlineButton(

                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      onPressed: (){},
                      child: const Text("Cancel",style: TextStyle(fontSize: 14,letterSpacing:2.2,color: Colors.black ))
                  ),
                  RaisedButton(onPressed: (){},
                      color: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: const Text("Save",
                          style: TextStyle(fontSize: 14,letterSpacing: 2.2,color:Colors.white)
                      ))

                ],
              ),

            ],),
        ),
      ),
    );
  }
  Widget buildtextfield(String labelText,String placeholder,bool ispass,bool isemail)
  {
    return Padding(
      padding: const EdgeInsets.only(bottom:25.0),
      child: TextField(
        // controller: TextEditingController()..text = placeholder,
        obscureText: ispass?showpass:true,
        enabled: isemail,
        decoration: InputDecoration(
            suffixIcon: ispass ? IconButton(
              onPressed: (){
                setState(() {
                  showpass=!showpass;
                });
              },
              icon:const Icon(Icons.remove_red_eye,color: Colors.grey),

            ):null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold,
                color: Colors.black
            )
        ),
      ),
    );

  }
}
