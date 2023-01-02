import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../home/widgets/custom_button_widget.dart';
import '../../widgets/Videowidget.dart';

class EveryoneWatching extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;
  const EveryoneWatching({
    Key? key, required this.posterPath, required this.movieName, required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        Text(
          movieName,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        kheight,
        Text(description,
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.grey),
        ),
        kheight50,
        VideoWidget(url: posterPath,),
        kheight20,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButton(
              title: 'Share',
              icon: Icons.send,
              iconsize: 25,
              textsize: 15,
            ),
            kwidth20,
            CustomButton(
              title: 'My List',
              icon: Icons.add,
              iconsize: 25,
              textsize: 15,
            ),
            kwidth20,
            CustomButton(
              title: 'Play',
              icon: Icons.play_arrow,
              iconsize: 25,
              textsize: 15,
            ),
            kwidth20
          ],
        )
      ],
    );
  }
}
