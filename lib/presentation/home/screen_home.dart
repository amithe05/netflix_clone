
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/Home/home_bloc.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';

import 'package:netflix/presentation/home/widgets/number_title_card.dart';

import '../widgets/main_titlecard.dart';

ValueNotifier<bool> scrollnotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        BlocProvider.of<HomeBloc>(context).add(const Gethomescreendata());
      },
    );

    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollnotifier,
      builder: ((BuildContext context, index, _) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;

            if (direction == ScrollDirection.reverse) {
              scrollnotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollnotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.isloading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    );
                  } else if (state.hasError) {
                    return const Center(child: Text("Error while getting data"));
                  }

                  final releasedpastyear = state.pastyearmovielist.map((e) {
                    return '$imageappendurl${e.posterPath}';
                  }).toList();
                  final trending = state.trendingmovielist.map((e) {
                    return '$imageappendurl${e.posterPath}';
                  }).toList();
                  final tensedramas = state.tensedramemovielist.map((e) {
                    return '$imageappendurl${e.posterPath}';
                  }).toList();

                  final southindianlist = state.southIndianmovielist.map((e) {
                    return '$imageappendurl${e.posterPath}';
                  }).toList();

                  final toptvshows = state.trendingTvlist.map((e) {
                    return '$imageappendurl${e.posterPath}';
                  }).toList();
               releasedpastyear.shuffle();

                  return ListView(
                    children: [
                      const BackgroundCard(),
                      MainTitleCard(
                        title1: 'Released in the past year',
                        posterlist:releasedpastyear,
                      ),
                      kheight,
                      MainTitleCard(
                        title1: 'Trending Now',
                        posterlist: trending,
                      ),
                      kheight,
                      NumberTitleCard(
                        tvlisturl: toptvshows,
                      ),
                      kheight,
                      MainTitleCard(
                        title1: 'Tense Dramas',
                        posterlist: tensedramas,
                      ),
                      kheight,
                      MainTitleCard(
                        title1: 'South Indian cinema',
                        posterlist: southindianlist,
                      ),
                    ],
                  );
                },
              ),
              scrollnotifier.value == true
                  ? AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      height: 90,
                      color: Colors.black.withOpacity(0.2),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 19, top: 5),
                                child: Image.asset(
                                  'assets/images/logo.ico',
                                  width: 35,
                                  height: 40,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.cast,
                                    size: 26,
                                  ),
                                  kwidth,
                                  SizedBox(
                                    width: 26,
                                    height: 26,
                                    child: Image.asset(
                                        'assets/images/netflixavatar.png'),
                                  ),
                                  kwidth
                                ],
                              )
                            ],
                          ),
                          kheight20,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                'TV shows',
                                style: khometitletext,
                              ),
                              Text(
                                'Movies',
                                style: khometitletext,
                              ),
                              Text(
                                "Categories",
                                style: khometitletext,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  : kheight
            ],
          ),
        );
      }),
    ));
  }
}
