
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:netflix/presentation/new_and_hot/widgets/comingsoonwidget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/everyonewatchingwidget.dart';

import '../../application/hot_and_new/hot_and_new_bloc.dart';
import '../../core/constants/constants.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              title: Text(
                'New and hot',
                style: GoogleFonts.montserrat(
                    fontSize: 31, fontWeight: FontWeight.bold),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  size: 26,
                ),
                kwidth,
                SizedBox(
                  width: 26,
                  height: 26,
                 child: Image.asset("assets/images/netflixavatar.png"),
                ),
                kwidth,
                kheight
              ],
              
              bottom: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  isScrollable: true,
                  unselectedLabelColor: Colors.white,
                  labelColor: Colors.black,
                  labelStyle:
                      const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35)),
                  tabs:const [
                    Tab(
                      text: "🍿 Coming soon",
                    ),
                    Tab(
                      text: "👀 Everyone watching",
                    )
                  ]),
            )),
        body:const TabBarView(children: [
          ComingSoonList(
            key: Key('coming_soon'),
          ),
          Everyoneiswatchinglist(key: Key('everyone_is_watching'),)
        ]),
      ),
    );
  }

}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<HotAndNewBloc>(context).add(const Loaddataincomingsoon());
    });
    return RefreshIndicator(
      onRefresh: (() async{
              BlocProvider.of<HotAndNewBloc>(context).add(const Loaddataincomingsoon());

        
      }),
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.isError) {
            return const Center(child: Text("An error occured"));
          } else if (state.comingsoonlist.isEmpty) {
            return const Center(child: Text("No value \n empty list"));
          } else {
            return ListView.builder(
              padding: const EdgeInsets.only(top: 20),
                itemCount: state.comingsoonlist.length,
                itemBuilder: (BuildContext context, index) {
                  final movie = state.comingsoonlist[index];
                  if (movie.id == null) {
                    return const SizedBox();
                  }
                  final date = DateTime.parse(movie.releaseDate!);
                  final formatedDate = DateFormat.yMMMMd('en_US').format(date);
    
                  return ComingSoonWidget(
                      id: movie.id.toString(),
                      month: formatedDate
                          .split(' ')
                          .first
                          .substring(0, 3)
                          .toUpperCase(),
                      day: movie.releaseDate!.split('-')[1],
                      posterPath: '$imageappendurl${movie.posterPath}',
                      movieName: movie.originalTitle ?? 'no title',
                      description: movie.overview ?? 'NO description');
                });
          }
        },
      ),
    );
  }
}

class Everyoneiswatchinglist extends StatelessWidget {
  const Everyoneiswatchinglist({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const Loaddataineveryonewatching());
    });
    return RefreshIndicator(
      onRefresh: (() async{
         BlocProvider.of<HotAndNewBloc>(context)
          .add(const Loaddataineveryonewatching());
        
      }),
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.isError) {
            return const Center(child: Text("An error occured"));
          } else if (state.everyoneiswatching.isEmpty) {
            return const Center(child: Text("No value \n empty list"));
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(20),
                itemCount: state.everyoneiswatching.length,
                itemBuilder: (BuildContext context, index) {
                  final movie = state.everyoneiswatching[index];
                  if (movie.id == null) {
                    return const SizedBox();
                  }
              
            
                  final tv = state.everyoneiswatching[index];
    
                  return EveryoneWatching(
                      posterPath: '$imageappendurl${tv.posterPath}',
                      movieName: tv.originalName?? 'NO name',
                      description: tv.overview ?? 'No description');
                });
          }
        },
      ),
    );
  }
}
