import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/core/constants/constants.dart';

import '../../../application/search/search_bloc.dart';
import 'title.dart';

class SearchIdle extends StatelessWidget {
  const SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Top Searches',
        ),
        kheight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                const Center(
                  child: Text("Error while getting data"),
                );
              } else if (state.idlelist.isEmpty) {
                const Center(
                  child: Text("no data"),
                );
              }
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return TopSearchTile(
                      title: state.idlelist[index].title ?? "NO TITle",
                      imageurl:
                          '$imageappendurl${state.idlelist[index].posterPath}');
                }),
                separatorBuilder: ((context, index) => kheight20),
                itemCount: state.idlelist.length,
              );
            },
          ),
        )
      ],
    );
  }
}

class TopSearchTile extends StatelessWidget {
  final String title;
  final String imageurl;
  const TopSearchTile({super.key, required this.title, required this.imageurl});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
            width: screenwidth * 0.38,
            height: 80,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(imageurl)))),
        kwidth,
        Expanded(
            child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        )),
        const Icon(
          Icons.play_circle_outline,
          size: 45,
        ),
      ],
    );
  }
}
