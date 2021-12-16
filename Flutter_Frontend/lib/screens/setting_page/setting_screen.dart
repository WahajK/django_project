import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:untitled/screens/profile_page/icon_widget.dart';
import 'package:untitled/screens/setting_page/acoount_page.dart';
import 'package:untitled/screens/setting_page/notification_page.dart';
class settingpage extends StatefulWidget{
  @override
  _settingpagestate createState()  => _settingpagestate();
}
class _settingpagestate extends State<settingpage>{
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Settings'),
    centerTitle:true,),
    body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(24),
          children: [

            SettingsGroup(title: 'General', children: <Widget>[
              accountpage(),
              notificationpage(),
              buildlogout(),
              builddelaccount(),],
           ),
            const SizedBox(height: 32,),
            SettingsGroup(title: 'FeedBack', children: <Widget>[
              const SizedBox(height:  8,),
              buildreportbug(context),
              buildsendfeedback(context),
            ])

          ],
        )),
  );
  Widget buildlogout() => SimpleSettingsTile(
      title:'Logout',
     subtitle: ' ',
  leading: IconWidget(icon: Icons.logout,color: Colors.blueAccent),
  onTap:()=> {},

  );
  Widget builddelaccount() => SimpleSettingsTile(
    title:'Delete Account',
    subtitle: ' ',
    leading: IconWidget(icon: Icons.delete,color: Colors.pink),
    onTap:(){}

  );
  Widget buildreportbug(BuildContext context)=> SimpleSettingsTile(
      title: 'Report a Bug',
    subtitle: ' ',
  leading: IconWidget(icon: Icons.bug_report, color: Colors.teal),
  onTap: () {

  },);
  Widget buildsendfeedback(BuildContext context) => SimpleSettingsTile(
      title: 'Send FeedBack',
    subtitle: ' ',
       leading: IconWidget(icon: Icons.thumb_up, color: Colors.purple),
       onTap: ()
       {},);
}

