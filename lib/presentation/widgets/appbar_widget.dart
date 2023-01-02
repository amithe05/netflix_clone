import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/constants/constants.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style:
              GoogleFonts.montserrat(fontSize: 31, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          size: 26,
        ),
        kwidth,
        Container(
          width: 26,
          height: 26,
          color: Colors.blue,
        ),
        kwidth
      ],
    );
  }
}
