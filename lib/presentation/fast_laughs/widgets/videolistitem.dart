import 'package:flutter/material.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/domain/downloads/models/downloads..dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;
  const VideoListItemInheritedWidget(
      {super.key, required this.widget, required this.movieData})
      : super(child: widget);
  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  const VideoListItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;
    final videoUrl = dummyvideoUrls[index % dummyvideoUrls.length];
    return Stack(
      children: [
        FastLaughVideoPlayer(videoUrl: videoUrl, onStatechanged: (bool) {}),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // leftside
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.volume_off),
                  ),
                ),
                // rightside
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: posterPath == null
                            ? null
                            : NetworkImage(
                                "$imageappendurl$posterPath",
                              ),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: likedVideosIdsNotifier,
                      builder: (context, Set<int> newLikedListIds, _) {
                        final _index = index;
                        if (newLikedListIds.contains(_index)) {
                          return GestureDetector(
                            onTap: (() {
                              likedVideosIdsNotifier.value.remove(index);
                              likedVideosIdsNotifier.notifyListeners();
                            }),
                            child: VideoActionWidget(
                              icon: Icons.favorite_outlined,
                              title: 'Liked',
                              iconcolor: Colors.pink.shade500,
                            ),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            likedVideosIdsNotifier.value.add(index);
                            likedVideosIdsNotifier.notifyListeners();
                          },
                          child: VideoActionWidget(
                              icon: Icons.emoji_emotions, title: 'LOL'),
                        );
                      },
                    ),
                    VideoActionWidget(
                      icon: Icons.add,
                      title: 'My List',
                    ),
                    GestureDetector(
                      onTap: () {
                        final movieName =
                            VideoListItemInheritedWidget.of(context)
                                ?.movieData
                                .title;
                        if (movieName != null) {
                          Share.share(movieName);
                        }
                      },
                      child: VideoActionWidget(
                        icon: Icons.share,
                        title: 'Share',
                      ),
                    ),
                    VideoActionWidget(
                      icon: Icons.play_arrow,
                      title: 'Play',
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  VideoActionWidget(
      {super.key, required this.icon, required this.title, this.iconcolor});
  final IconData icon;
  var iconcolor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 11),
      child: Column(
        children: [
          Icon(
            icon,
            color: iconcolor,
          ),
          Text(title),
        ],
      ),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStatechanged;
  const FastLaughVideoPlayer(
      {super.key, required this.videoUrl, required this.onStatechanged});

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _videoPlayerController.play();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
