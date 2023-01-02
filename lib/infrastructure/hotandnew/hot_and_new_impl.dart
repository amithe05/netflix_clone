import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/HotandNew/Models/hot_and_new.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix/domain/HotandNew/hot_and_new_service.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';

import '../../domain/core/api_endpoints.dart';

@LazySingleton(as: HotAndNewService)
class HotAndNewImplementation implements HotAndNewService {
  @override
  Future<Either<MainFailure, HotAndNew>> gethotandnewmoviedata() async {
    try {
      final response =
          await Dio(BaseOptions()).get(Apiendpoints.hotandnewmovie);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNew.fromJson(response.data);
      

        return right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return left(const MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, HotAndNew>> gethotandnewtvdata() async {
    try {
      final response = await Dio(BaseOptions()).get(Apiendpoints.hotandnewtv);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNew.fromJson(response.data);

        return right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return left(const MainFailure.clientFailure());
    }
  }
}
