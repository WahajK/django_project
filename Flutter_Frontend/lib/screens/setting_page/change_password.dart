import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:untitled/screens/profile_page/icon_widget.dart';

class changepassword extends StatelessWidget{
  static const keyPassword ='key-password';
  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
    title: 'Security',
    subtitle: ' ',
    leading: IconWidget(icon: Icons.security, color: Colors.red),
    child: SettingsScreen(
      title: 'Security Settings',
      children: <Widget>[
        buildpassword(),
      ],
    ),

  );
  Widget buildpassword() => TextInputSettingsTile(
    settingKey : keyPassword,

    title: 'Change Password',

    borderColor: Colors.black,
    obscureText: true,
    validator: (password) => password != null && password.length >= 6
      ? null
        : 'Enter 8 characters',

  );
}