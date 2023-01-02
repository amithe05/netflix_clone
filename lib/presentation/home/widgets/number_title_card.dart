import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../widgets/main_title.dart';
import 'number_card.dart';

class NumberTitleCard extends StatelessWidget {
  final List<String> tvlisturl;
  const NumberTitleCard({
    Key? key, required this.tvlisturl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: 'Top 10 TV shows in India Today'),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                10,
                (index) => Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: NumberCard(
                        imageurl: tvlisturl[index],
                        index: index + 1,
                      ),
                    )),
          ),
        )
      ],
    );
  }
}
