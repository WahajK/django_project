import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/main.dart';
import 'package:untitled/models/worker_model.dart';

class GridCard extends StatefulWidget {
  final Worker workers;

  const GridCard({required this.workers});

  @override
  State<GridCard> createState() => _GridCardState();
}

class _GridCardState extends State<GridCard> {
  var _isFavorite = false;

  @override
  void initState() {
    // _isFavorite = widget.product.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (ctx) => ProductDetailScreen(product: widget.product),
        //   ),
        // );
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
                  widget.workers.image.substring(1,widget.workers.image.length),
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
                tag: widget.workers.image.substring(1,widget.workers.image.length),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage(      ///changes image
                        widget.workers.image.substring(1,widget.workers.image.length),
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
                    const Text(
                      '€100',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .25,
                      child: Text(
                        widget.workers.fname,
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
                IconButton(
                  icon: _isFavorite
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(Icons.favorite_border_outlined),
                  onPressed: () {
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
