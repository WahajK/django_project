import 'package:untitled/models/worker_model.dart';
import 'package:untitled/screens/home_screen/components/grid_card.dart';
import 'package:untitled/screens/worker_screen//constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:untitled/screens/worker_screen//request.dart';
import 'package:untitled/models/worker_model.dart';

class workerdetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.blueGrey[50],
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
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(112)),
            color: kBlueColor,
          ),
          height: MediaQuery.of(context).size.height * 0.35,
          child: const Center(
            child: Text(
              "Worker Info",
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
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                color: Colors.blueGrey[50],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      tappedWorker.fname,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: kIndigoDark,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    
                    // SizedBox(
                    //   height: 8,
                    // ),
                    const Text(
                      "Description:",
                      style: TextStyle(
                        color: kIndigoLight,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    // SizedBox(
                    //   height: 12,
                    // ),
                    Text(
                      tappedWorker.description,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(

                      children: [
                   //    Icons.align_horizontal_center,
                        Container(
                          color: Colors.blueGrey[50],
                          height: 18,
                          width: 18,
                          child: Image.asset('assets/star.png',fit:BoxFit.cover
                          ),
                        ),
                        // SvgPicture.asset(
                        //   'assets/svg/star.svg',
                        //   height: 18,
                        //   width: 18,
                        //   color: Colors.black,
                        // ),

                        const SizedBox(width: 10),
                        Text(
                          tappedWorker.rating.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          'Ratings and reviews',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text('See all'),
                        ),
                      ],
                    ),
                    _buildDocumentAttachmentWidget("Category",tappedWorker.category,true),
                    _buildDocumentAttachmentWidget("Contact No",tappedWorker.contact,false),
                    Center(
                      child: MaterialButton(
                        height: 40.0,
                        minWidth: 150.0,
                        shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),),
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                        child: const Text("Request",style: TextStyle(fontSize: 15),),
                        onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => AppointmentRequestPage())),
                        },
                        splashColor: const Color(0xff256fff),
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
              child: Image.asset(
                "Django_Backend"+tappedWorker.image,
                height: 100,
                width: 100,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildDocumentAttachmentWidget(String name,String details,bool ap) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      height: 70,
      color: Color(0xffE7F8FA),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 3,
            color: kBlueLight,
          ),
          Padding(
              padding: const EdgeInsets.all(16),
              child: ap==true ? Icon(
                Icons.category_outlined,
                color: kBlueLight,
              ):Icon(
                Icons.call_rounded,
                color: kBlueLight,
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
                  color: kIndigoDark,
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
