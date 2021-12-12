import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:untitled/icon_widget.dart';
import 'package:untitled/setting_page/change_password.dart';
class accountpage extends StatelessWidget {
  static const keyPassword = 'key-password';
  @override
  Widget build(BuildContext context)=>SimpleSettingsTile(
    title: 'Account Settings',
  subtitle: 'Privacy,Security,Account Info',
  leading:
    IconWidget(icon: Icons.person, color: Colors.green),
  child: SettingsScreen(
    title: 'Account Settings',
    children: <Widget>[
      buildprivacy(context),
      changepassword(),
      accountinfo(context),
    //  Wpassword(),
    ],
  ),);
  Widget buildprivacy (BuildContext context) => SimpleSettingsTile(
    title: 'Privacy',
    subtitle: '',
    leading: IconWidget(icon: Icons.lock,color: Colors.blue,),
    onTap: (){},
  );
  Widget buildsecurity(BuildContext context)=> SimpleSettingsTile(
      title: 'Security',
  subtitle: '',
  leading: IconWidget(icon: Icons.security, color: Colors.red),
    onTap: (){
        changepassword();
    },
  );
  Widget accountinfo (BuildContext context) =>  SimpleSettingsTile( 
      title: 'Account Info',
  subtitle: '',
  leading: IconWidget(icon: Icons.text_snippet, color: Colors.purple),
  onTap: (){

  },);
  Widget Wpassword() => TextInputSettingsTile(
    settingKey : keyPassword,
    title: 'Password',
    obscureText: true,
    validator: (password) => password != null && password.length >= 6
        ? null
        : 'Enter 8 character',

  );
}