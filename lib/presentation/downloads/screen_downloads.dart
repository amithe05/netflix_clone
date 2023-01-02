import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/presentation/widgets/appbar_widget.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({super.key});
  final List widgetlist = [
    const SizedBox(height: 3),
    const _smartdownloads(),
    const Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              title: ' Downloads',
            )),
        body: ListView.separated(
          itemBuilder: (context, index) {
            return widgetlist[index];
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 20,
            );
          },
          itemCount: widgetlist.length,
        ));
  }
}

class _smartdownloads extends StatelessWidget {
  const _smartdownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kwidth,
        Icon(Icons.settings),
        kwidth,
        Text(
          'Smart Downloads',
          style: TextStyle(fontSize: 17),
        )
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.imagelist,
    required this.angle,
    required this.margin,
    required this.size,
  }) : super(key: key);

  final String imagelist;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(imagelist))),
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
   WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getdownloadsimage());
    });

    return Column(
      children: [
        const Text(
          "Introducing Downloads for you ",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
        ),
        const Text(
          "We will download a personalised selection of \nmovies and shows for you so \n there is always something to watch on your \ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        kheight,
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              child: state.isLoading
                  ? const SizedBox(
                      height: 2,
                      width: 2,
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.5),
                            radius: MediaQuery.of(context).size.width * 0.37,
                          ),
                        ),
                        DownloadsImageWidget(
                          angle: 11,
                          imagelist:
                          
                              '$imageappendurl${state.downloads[0].posterPath}',
                          margin: const EdgeInsets.only(left: 170, bottom: 38),
                          size: Size(MediaQuery.of(context).size.width * 0.4,
                              MediaQuery.of(context).size.width * 0.5),
                        ),
                        DownloadsImageWidget(
                          angle: -13,
                          imagelist:
                              '$imageappendurl${state.downloads[1].posterPath}',
                          margin: const EdgeInsets.only(right: 170, bottom: 38),
                          size: Size(MediaQuery.of(context).size.width * 0.4,
                              MediaQuery.of(context).size.width * 0.5),
                        ),
                        DownloadsImageWidget(
                          angle: 0,
                          imagelist:
                              '$imageappendurl${state.downloads[2].posterPath}',
                          margin: const EdgeInsets.only(top: 0),
                          size: Size(MediaQuery.of(context).size.width * 0.42,
                              MediaQuery.of(context).size.width * 0.59),
                        )
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              color: Colors.blue.shade900,
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Set  up",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          color: Colors.white,
          onPressed: () {},
          child: Text(
            "See what you can download",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
