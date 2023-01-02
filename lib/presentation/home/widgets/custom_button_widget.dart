import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.icon,
    this.iconsize = 25,
    this.textsize = 14,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final double iconsize;
  final double textsize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: iconsize,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: textsize,
          ),
        )
      ],
    );
  }
}
