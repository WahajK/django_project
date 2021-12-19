import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/main.dart';
import 'package:untitled/models/worker_model.dart';
import 'package:untitled/screens/worker_screen/workerdetail.dart';

late Worker tappedWorker;
class GridCard extends StatefulWidget {
  final Worker workers;

  const GridCard({required this.workers});

  @override
  State<GridCard> createState() => _GridCardState();
}
class AppointmentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xff2B7EFF)),
      ),
      home: workerdetail(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class _GridCardState extends State<GridCard> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        tappedWorker = widget.workers;
        debugPrint(widget.workers.fname);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => AppointmentApp(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 180,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "Django_Backend"+widget.workers.image,
                  height: 20,
                  width: 20,
                ),
                const Spacer(),
                SvgPicture.asset(
                  'assets/svg/star.svg',
                  height: 18,
                  width: 18,
                ),
                const SizedBox(width: 5),
                // Text(
                //   widget.workers.fname,
                //   style: const TextStyle(
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ],
            ),
            Expanded(
              child: Hero(
                tag: "Django_Backend"+widget.workers.image,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage(      ///changes image
                        "Django_Backend"+widget.workers.image,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.workers.fname,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .25,
                      child: Text(
                        widget.workers.category,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // IconButton(
                //   icon: const Icon(
                //           Icons.arrow_right,
                //           color: Colors.red,
                //         ),
                //   onPressed: () {
                    
                //   },
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
