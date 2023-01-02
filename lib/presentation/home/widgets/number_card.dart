import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class NumberCard extends StatelessWidget {
  final int index;
  final String imageurl;

  const NumberCard({
    Key? key,
    required this.index, required this.imageurl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 30,
              height: 210,
            ),
            Container(
              width: 130,
              height: 210,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image:  DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageurl))),
            ),
          ],
        ),
        Positioned(
          left: -4,
          bottom: -26,
          child: BorderedText(
            strokeWidth: 4.0,
            strokeColor: Colors.white,
            child: Text("$index",
                style: const TextStyle(
                    fontSize: 120,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }
}
