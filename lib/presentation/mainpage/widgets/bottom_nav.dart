import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: ((context, int newindex, child) {
          return BottomNavigationBar(
            currentIndex: newindex,
            onTap: ((index) {
              indexChangeNotifier.value = index;
            }),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.collections),
                label: 'New & Hot',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.emoji_emotions),
                label: 'Fast Laughs',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.arrow_downward_outlined),
                label: 'Downloads',
              )
            ],
          );
        }));
  }
}
