import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import 'main_title.dart';
import 'maincard.dart';

class MainTitleCard extends StatelessWidget {
  final String title1;
  final List<String> posterlist;

  const MainTitleCard({
    Key? key,
    required this.title1, required this.posterlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title1),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                posterlist.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: MainCard(imageurl: posterlist[index],),
                    )),
          ),
        )
      ],
    );
  }
}
