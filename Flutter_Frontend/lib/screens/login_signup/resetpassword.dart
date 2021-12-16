import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:untitled/screens/login_signup/resetpassword.dart';
import 'package:flutter/services.dart';


class reset_page extends StatefulWidget {
  @override
  _resetPageState createState() => _resetPageState();
}

class _resetPageState extends State<reset_page> {

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/3.5,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff6bceff),
                      Color(0xff6bceff)
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(90)
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.person,
                      size: 90,
                      color: Colors.white,
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: 22,
                          right: 32
                      ),
                      child: Text('Reset',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 62),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    padding: const EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(50)
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5
                          )
                        ]
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.mail,
                          color: Color(0xff6bceff),
                        ),
                        hintText: 'Email',
                      ),
                    ),
                  ),

SizedBox(height: 20,),

                  InkWell(
                    onTap: (){
                       Navigator.of(context).push(MaterialPageRoute(
                           builder: (context) => HomeScreen()));
                    },
                    child: Container(

                      height: 45,
                      width: 200,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff6bceff),
                              Color(0xFF00abff),
                            ],
                          ),
                          borderRadius: BorderRadius.all(
                              Radius.circular(50)
                          )
                      ),
                      child: Center(
                        child: Text('Send Mail'.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //SizedBox(height: 20,),
            InkWell(
              onTap: (){
                Navigator.pop(context);;
              },
              child: Container(
                height: 45,
                width: 200,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff6bceff),
                        Color(0xFF00abff),
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                        Radius.circular(50)
                    )
                ),
                child: Center(
                  child: Text('Login'.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
          ],

        ),
      ),
    );

  }
}
