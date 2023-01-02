
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';

import '../../domain/core/failures/main_failure.dart';
import '../../domain/downloads/models/downloads..dart';
part 'downloads_bloc.freezed.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownlaodsRepo _downloadsrepo;
  DownloadsBloc(this._downloadsrepo) : super(DownloadsState.initial()) {
    on<_DownloadsImage>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        downloadsfailureorsuccess:const None(),
      ));
      final Either<MainFailure, List<Downloads>> downloadoption =
          await _downloadsrepo.getdownloadsimage();

      emit(downloadoption.fold(
          (failure) => state.copyWith(
              isLoading: false, downloadsfailureorsuccess: some(left(failure))),
          (success) => state.copyWith(
              isLoading: false,
              downloads: success,
              downloadsfailureorsuccess: some(right(success)))));
    });
  }
}
