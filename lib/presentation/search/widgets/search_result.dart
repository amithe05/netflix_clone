import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

import '../../../application/search/search_bloc.dart';

class ScreenResultWidget extends StatelessWidget {
  const ScreenResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & TV'),
        kheight20,
        Expanded(child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return GridView.count(
                mainAxisSpacing: 10,
                crossAxisSpacing: 9,
                crossAxisCount: 3,
                childAspectRatio: 1 / 1.5,
                children: List.generate(20, (index) {
                  return Maincard(
                      imageurl:
                          '$imageappendurl${state.searchresultlist![index].posterPath}');
                }));
          },
        ))
      ],
    );
  }
}

class Maincard extends StatelessWidget {
  final String imageurl;
  const Maincard({super.key, required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(imageurl))),
    );
  }
}
