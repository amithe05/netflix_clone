import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';

import '../../domain/downloads/models/downloads..dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyvideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4"
];

ValueNotifier<Set<int>> likedVideosIdsNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IDownlaodsRepo _downloadService,
  ) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      emit(const FastLaughState(
        videolist: [],
        isLoading: true,
        isError: false,
      ));
      final result = await _downloadService.getdownloadsimage();
      result.fold((MainFailure l) {
        emit(const FastLaughState(
          videolist: [],
          isLoading: false,
          isError: true,
        ));
      }, (resp) {
        emit(FastLaughState(
          videolist: resp,
          isLoading: false,
          isError: false,
        ));
      });
    });
    on<Likevideo>((event, emit) async {
      likedVideosIdsNotifier.value.add(event.id);
    });
    on<Dislikevideo>((event, emit) async {
      likedVideosIdsNotifier.value.remove(event.id);
    });
  }
}
