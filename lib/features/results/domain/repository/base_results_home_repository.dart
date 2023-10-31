import 'package:dartz/dartz.dart';
import 'package:nzaker/features/results/domain/entities/home_entity_response.dart';

import '../../../../core/error/failure.dart';

abstract class BaseResultsHomeRepository{
  Future<Either<Failure,HomeEntityResponse>> getHomePageData();

}