import 'package:flutter/material.dart';

import 'custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/f2PVrphK0u81ES256lw3oAZuF3x.jpg'))),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CustomButton(
                  icon: Icons.add,
                  title: 'My List',
                ),
                _playButton(),
                const CustomButton(
                  title: 'info',
                  icon: Icons.info,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow,
          size: 28,
          color: Colors.black,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Play',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ));
  }
}
