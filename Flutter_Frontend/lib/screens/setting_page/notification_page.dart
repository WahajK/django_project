import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/src/settings.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:untitled/screens/profile_page/icon_widget.dart';

class notificationpage extends StatelessWidget {

  static const keyNews= 'key-news';
  static const keyActivity= 'key-activity';
  static const keyEmail =' email';
  static const  keyAppupdated ='key-Appupdates';
  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
      title: 'Notifications',
  subtitle: 'News,App Updates,Email Updates',
  leading: IconWidget(icon: Icons.notifications, color: Colors.redAccent),

child:SettingsScreen(
      title: 'Notifications',
      children: <Widget>[
          buildnews(),
  buildactivity(),
  emailactivity(),
  buildappupdates(),

  ],
  ));
      Widget buildnews() => SwitchSettingsTile(
  settingKey: keyNews,
  leading: IconWidget(icon: Icons.message, color: Colors.blueAccent),
  title: 'News For You',);
      Widget buildactivity() => SwitchSettingsTile(
          title: 'Account Activity',
          settingKey: keyActivity,
      leading: IconWidget(icon: Icons.person, color: Colors.orangeAccent),
      );
      Widget emailactivity() => SwitchSettingsTile(title: 'Email Activity', settingKey: keyEmail,
      leading: IconWidget(icon: Icons.email, color: Colors.redAccent),
      );
      Widget buildappupdates() => SwitchSettingsTile(title: 'App Updates', settingKey: keyAppupdated,
      leading:IconWidget(icon: Icons.android,  color: Colors.tealAccent) ,);

      
}