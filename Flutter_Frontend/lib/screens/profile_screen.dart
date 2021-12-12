import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled/profile_widget.dart';
import 'package:untitled/setting_page/setting_screen.dart';
import 'package:untitled/user.dart';
import 'package:untitled/userpref.dart';

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
        actions: [ IconButton(icon: Icon(Icons.settings,color: Colors.blue,), onPressed: () {
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
              Text("Edit Profile",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)
              ),
              SizedBox(height: 10,),
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
                    // Container(
                    //   width: 130,
                    //   height: 130,
                    //   decoration: BoxDecoration(
                    //       border: Border.all(
                    //           width: 4,
                    //           color: Theme
                    //               .of(context)
                    //               .scaffoldBackgroundColor
                    //       ),
                    //       boxShadow: [BoxShadow(
                    //           spreadRadius: 2,
                    //           blurRadius: 10,
                    //           color: Colors.black.withOpacity(0.1)
                    //           , offset: Offset(0, 10)
                    //       )
                    //       ],
                    //       shape: BoxShape.circle,
                    //       image: DecorationImage(
                    //           fit: BoxFit.cover,
                    //           image: AssetImage('images/wallpaper.png')
                    //       )
                    //   ),
                    // ),
                    // Positioned(
                    //     bottom: 0,
                    //     right: 0,
                    //     child:
                    //     Container(
                    //       height: 40,
                    //       width: 40,
                    //       decoration: BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         border: Border.all(
                    //             width: 4,
                    //             color: Theme
                    //                 .of(context)
                    //                 .scaffoldBackgroundColor
                    //         ),
                    //         color: Colors.blueAccent,
                    //       ),
                    //       child: Icon(Icons.edit, color: Colors.white),
                    //     )
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              buildtextfield("User Name", "fareed idrees",false,false),
              buildtextfield("Full Name", "fareed idrees",false,true),
              buildtextfield("Email", "abc@gmail.com",false,false),
              buildtextfield("Password", "********",true,true),
              buildtextfield("Address", "ABC",false,true ),
              buildtextfield("Phone_No", "03XXXXXXXXX", false, true),
            //  SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  OutlineButton(

                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      onPressed: (){},
                      child: Text("Cancel",style: TextStyle(fontSize: 14,letterSpacing:2.2,color: Colors.black ))
                  ),
                  RaisedButton(onPressed: (){},
                      color: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: Text("Save",
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
        obscureText: ispass?showpass:true,
        enabled: isemail,
        decoration: InputDecoration(
            suffixIcon: ispass ? IconButton(
              onPressed: (){
                setState(() {
                  showpass=!showpass;
                });
              },
              icon:Icon(Icons.remove_red_eye,color: Colors.grey),

            ):null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold,
                color: Colors.black
            )
        ),
      ),
    );

  }
}
