import 'package:flutter/material.dart';
import 'package:worker/constants.dart';
import 'package:worker/screens/HomeScreen/pages/request_accept_reject_page.dart';

class AppointmentRequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          _buildBackground(context),
          Positioned(
            child: _buildContentUI(),
            top: MediaQuery.of(context).size.height * 0.27,
            left: 40,
          ),
        ],
      ),
    );
  }

  Widget _buildBackground(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(112)),
            color: Color(0xFFFF7643),
          ),
          height: MediaQuery.of(context).size.height * 0.35,
          child: Center(
            child: Text(
              "12 Jan 2020, \n8am - 10 am",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // SizedBox(
                    //   height: 24,
                    // ),
                    Text(
                      "Louis",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: kIndigoDark,
                      ),
                    ),
                    // SizedBox(
                    //   height: 8,
                    // ),
                    Text(
                      "Patterson",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: kIndigoDark,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Description:",
                      style: TextStyle(
                        color: kIndigoLight,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Hello Peterson, My Bathroom Shower is not working properly I want it to fixed ASAP ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    _buildDocumentAttachmentWidget("Address","Abc Building",true),
                    _buildDocumentAttachmentWidget("Contact No","03XX-XXXXXXXXX",false),
                    Center(
                      child: MaterialButton(
                        height: 50.0,
                        minWidth: 200.0,
                        shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),),
                        color: Color(0xFFFF7643),
                        textColor: Colors.white,
                        child: new Text("Accept",style: TextStyle(fontSize: 20),),
                        onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Body(name: "Accepted",temp: true,))),
                        },
                        splashColor: Color(0xFFFFECDF),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Center(
                      child: MaterialButton(
                        height: 40.0,
                        minWidth: 150.0,
                        shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),),
                        color:Color(0xFFFFECDF),
                        textColor: Colors.black,
                        child: Text("Reject",style: TextStyle(fontSize: 17,fontWeight:FontWeight.bold ),),
                        onPressed: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Body(name: "Rejected",temp: true,))),
                        },
                        splashColor: Color(0xff256fff),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildContentUI() {
    return Row(
      children: <Widget>[
        Hero(
          tag: 1,
          child: Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: Image.network(
                "https://www.thefamouspeople.com/profiles/images/edward-snowden-5.jpg",
                height: 100,
                width: 100,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 16,
        ),

      ],
    );
  }



  Widget _buildDocumentAttachmentWidget(String name,String details,bool ap) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      height: 70,
      color: Color(0xFFFFECDF),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 3,
            color: Color(0xFFFF7643),
          ),
          Padding(
              padding: const EdgeInsets.all(16),
              child: ap==true ? Icon(
                Icons.home,
                color: Color(0xFFFF7643),
              ):Icon(
                Icons.call_rounded,
                color: Color(0xFFFF7643),
              )

          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF757575),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                details,
                style: TextStyle(
                  fontSize: 16,
                  color: kIndigoLight,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
