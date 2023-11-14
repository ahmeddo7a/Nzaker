import 'package:dartz/dartz.dart';
import 'package:nzaker/core/basics/map_parameters.dart';
import 'package:nzaker/features/results/domain/entities/country_details_entities/country_details_entity.dart';
import 'package:nzaker/features/results/domain/entities/result_entities/natiga_entity.dart';

import '../../../../core/error/failure.dart';
import '../entities/home_entities/home_entity_response.dart';

abstract class BaseResultsHomeRepository{
  Future<Either<Failure,HomeEntityResponse>> getHomePageData();
  Future<Either<Failure,CountryDetailsEntity>> getCountryDetails(String parameters);
  Future<Either<Failure,NatigaEntity>> getResults(MapParameters parameters);

}