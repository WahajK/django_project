import 'package:untitled/screens/home_screen/components/grid_card.dart';
import 'package:untitled/screens/worker_screen/constants.dart';
import 'package:untitled/screens/worker_screen//widget/button_widget.dart';
import 'package:untitled/screens/worker_screen//widget/date_picker_widget.dart';
import 'package:untitled/screens/worker_screen//widget/date_range_picker_widget.dart';
import 'package:untitled/screens/worker_screen//widget/datetime_picker_widget.dart';
import 'package:untitled/screens/worker_screen//widget/time_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(112)),
            color: kBlueColor,
          ),
          height: MediaQuery.of(context).size.height * 0.35,

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

                    Text(
                      tappedWorker.fname,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: kIndigoDark,
                      ),
                    ),

                    const SizedBox(
                      height: 16,
                    ),
                    const TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        autocorrect: true,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)
                          ),
                          hintText: 'Type Text Here',
                          labelText: 'Description',
                        )
                    ),
    DatePickerWidget(),
                    const Text(
                      "Time range",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:20,
                        color: kIndigoDark,
                      ),
                    ),
    TimePickerWidget(),
                    TimePickerWidget(),
                    SizedBox(height: 5,),
                    Center(
                      child: MaterialButton(
                        height: 40.0,
                        minWidth: 150.0,
                        shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),),
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                        child: Text("Request",style: TextStyle(fontSize: 15),),
                        onPressed: () => {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => AppointmentRequestPage())),
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
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: Image.asset(
                "Django_Backend"+tappedWorker.image,
                height: 100,
                width: 100,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),

      ],
    );
  }



  Widget _buildDocumentAttachmentWidget() {
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
            child: Transform.rotate(
              angle: 3.14 / 180 * 45,
              child: Icon(
                Icons.attach_file,
                color: kBlueLight,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Complete blood count",
                style: TextStyle(
                  fontSize: 18,
                  color: kIndigoDark,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "05 Mar 2020",
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
