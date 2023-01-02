import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final imageurl;
  
  const MainCard({
    Key? key, required this.imageurl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 210,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageurl))),
    );
  }
}
