import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/api_endpoints.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/downloads/models/downloads..dart';

@LazySingleton(as: IDownlaodsRepo)
class DownloadRepository implements IDownlaodsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getdownloadsimage() async {
    try {
      final response = await Dio(BaseOptions()).get(Apiendpoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final downloadlist = (response.data['results'] as List).map((e) {
        
          return Downloads.fromJson(e);
        }).toList();
    

        return right(downloadlist);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return left(MainFailure.clientFailure());
    }
  }
}
