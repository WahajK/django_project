import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/src/settings.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:worker/icon_widget.dart';
class settingpage extends StatefulWidget{
  @override
  notificationpage createState()  => notificationpage();
}

class notificationpage extends State<settingpage> {

  static const keyNews= 'key-news';
  static const keyActivity= 'key-activity';
  static const keyEmail =' email';
  static const  keyAppupdated ='key-Appupdates';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:
    SafeArea(
      child: ListView(
        padding: EdgeInsets.all(24),
        children:[SimpleSettingsTile(
            child: SettingsScreen(
              title: 'Notifications',
              children: <Widget>[
                buildnews(),
                buildactivity(),
                emailactivity(),
                buildappupdates(),

              ],
            )),],
      ),
    ),
    );
  }
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