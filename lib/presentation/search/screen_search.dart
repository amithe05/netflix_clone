import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/domain/core/debounce/debounce_search.dart';

import 'widgets/search_idle_widget.dart';
import 'widgets/search_result.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});
  final _debouncer = Debouncer(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                if (value.isEmpty) {
                  return;
                }

                _debouncer.run(() {
                  BlocProvider.of<SearchBloc>(context)
                      .add(Searchmovie(movieQuery: value));
                });
              },
            ),
            kheight,
            Expanded(child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.searchresultlist == null ||
                    state.searchresultlist!.isEmpty) {
                  return const SearchIdle();
                } else {
                  return const ScreenResultWidget();
                }
              },
            ))
          ],
        ),
      )),
    );
  }
}
