import 'package:dartz/dartz.dart';
import 'package:netflix/domain/HotandNew/Models/hot_and_new.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';

abstract class HotAndNewService {
  Future<Either<MainFailure, HotAndNew>> gethotandnewmoviedata();
    Future<Either<MainFailure, HotAndNew>> gethotandnewtvdata();

 
  
}
