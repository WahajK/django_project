
import 'package:flutter/material.dart';
import 'package:untitled/UI/input_field.dart';
import 'package:untitled/home_page.dart';
import 'package:untitled/resetpassword.dart';
import 'package:untitled/UI/signup_page.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      //Material App
      debugShowCheckedModeBanner: false,
      title: "Loginaa App",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueGrey[50],
        fontFamily: 'MerriweatherSans',
      ),

      home: HomeScreen(),
    );

  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  //StateFullWidget

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/3.5,
              decoration: BoxDecoration(
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
                children: <Widget>[
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.person,
                      size: 90,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 32,
                          right: 32
                      ),
                      child: Text('Login',
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
                    padding: EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
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
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.person,
                          color: Color(0xff6bceff),
                        ),
                        hintText: 'Username',
                      ),
                    ),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    margin: EdgeInsets.only(top: 32),
                    padding: EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
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
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.vpn_key,
                          color: Color(0xff6bceff),
                        ),
                        suffixIcon: Icon(Icons.visibility,color:Color(0xff6bceff)),
                        hintText: 'Password',
                      ),
                    ),
                  ),

                  FlatButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => reset_page()));
                    },
                    textColor: Colors.black45,
                    child: Text('Forgot Password?'),
                  ),


                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    },
                    child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width/1.2,
                      decoration: BoxDecoration(
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
                          style: TextStyle(
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

            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't have an account ?"),
                  Text("Sign Up",style: TextStyle(color: Color(0xff6bceff)),),
                ],
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SignupPage()));
              },
            ),
          ],

        ),
      ),
    );

  }
}