import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/downloads/screen_downloads.dart';
import 'package:netflix/presentation/fast_laughs/screen_fast_laughs.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:netflix/presentation/mainpage/widgets/bottom_nav.dart';
import 'package:netflix/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaughs(),
    ScreenSearch(),
    ScreenDownload()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: ((context, int index, child) {
            return pages[index];
          }),
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
