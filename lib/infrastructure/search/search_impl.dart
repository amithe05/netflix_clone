import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/search/models/search_response/search_response.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix/domain/search/search_service.dart';

import '../../domain/core/api_endpoints.dart';

@LazySingleton(as: SearchService)
class searchimpl implements SearchService {
  @override
  Future<Either<MainFailure, SearchResponse>> searchmovies(
      {required String movieQuery}) async {
    try {
      final response = await Dio(BaseOptions())
          .get(Apiendpoints.search, queryParameters: ({'query': movieQuery}));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResponse.fromJson(response.data);

        return right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return left(const MainFailure.clientFailure());
    }
  }
}
