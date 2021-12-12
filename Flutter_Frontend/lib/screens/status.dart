import 'package:flutter/material.dart';
class TabBarDemo extends StatelessWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.app_registration),text: 'active',),
                Tab(icon: Icon(Icons.autorenew),text: 'Servicing'),
                Tab(icon: Icon(Icons.check_sharp),text: 'Completed'),
              ],
            ),
            centerTitle: true,
            title: const Text('Status'),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}