import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worker/screens/HomeScreen/homescreen.dart';
import 'package:worker/screens/default_screen/default_screen.dart';
 import 'package:worker/screens/HomeScreen/homescreen.dart';
import 'package:worker/screens/profile/profile_screen.dart';
// import 'package:loginpage/screens/profile_screen.dart';
// import 'package:loginpage/screens/search/search_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key,
  this.temp}) : super(key: key);
 final String? temp;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentIndex = 0;
  List screensList = [
    HomePage(),
    const DefaultScreen(),
     ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

     backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.lightBlueAccent,
      //
      //   elevation: 0,
      //   centerTitle: true,
      //   title:
      //   const Text(
      //     'Shoes Shop',
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //     ),
      //
      //   ),
      //   // leading:  IconButton(
      //   //   onPressed: () {},
      //   //   icon: const Icon(Icons.menu_book_sharp),
      //   // ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: SvgPicture.asset(
      //         'assets/svg/search.svg',
      //         height: 20,
      //         width: 20,
      //         color: Colors.white,
      //       ),
      //     ),
      //   ],
      // ),
      //extendBody: true,
      body: screensList[currentIndex],
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: DotNavigationBar(
            marginR: const EdgeInsets.symmetric(horizontal: 70,vertical: 5),
            backgroundColor: Colors.black,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            currentIndex: currentIndex,
            dotIndicatorColor: Color(0xFFFF7643),
            unselectedItemColor: Colors.white,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              DotNavigationBarItem(
                icon: const Icon(Icons.home_rounded),
                selectedColor: Colors.white,
              ),
              DotNavigationBarItem(
                icon: const Icon(Icons.add_circle_outline_sharp),
                selectedColor: Colors.white,
              ),
              DotNavigationBarItem(
                icon: const Icon(Icons.person_outline_rounded),
                selectedColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
