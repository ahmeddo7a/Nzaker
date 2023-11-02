import 'package:dartz/dartz.dart';
import 'package:nzaker/core/error/failure.dart';
import 'package:nzaker/features/results/data/data_source/results_home_data_source.dart';
import 'package:nzaker/features/results/domain/entities/country_details_entities/country_details_entity.dart';
import 'package:nzaker/features/results/domain/repository/base_results_home_repository.dart';

import '../../../../core/error/exception.dart';
import '../../domain/entities/home_entities/home_entity_response.dart';

class ResultsHomeRepository extends BaseResultsHomeRepository{
  BaseResultsHomeDataSource baseResultsHomeDataSource;
  ResultsHomeRepository(this.baseResultsHomeDataSource);

  @override
  Future<Either<Failure, HomeEntityResponse>> getHomePageData() async{
    try {
      final result =  await baseResultsHomeDataSource.getAllHomeData();
      return Right(result);
    } on ServerException catch(failure){
      String finalResponse = '';
      for (var element in failure.errorMessageModel!.response.entries) {
        if(element.value is List){
          String value = element.value.join(',')   ;
          finalResponse += '$value\n';
        }else{
          finalResponse += '${element.value}\n';
        }
      }
      return Left(ServerFailure(finalResponse.trim()));
    }
  }

  @override
  Future<Either<Failure, CountryDetailsEntity>> getCountryDetails(String parameters) async{
    try {
      final result =  await baseResultsHomeDataSource.getCountryDetails(parameters);
      return Right(result);
    } on ServerException catch(failure){
      String finalResponse = '';
      for (var element in failure.errorMessageModel!.response.entries) {
        if(element.value is List){
          String value = element.value.join(',')   ;
          finalResponse += '$value\n';
        }else{
          finalResponse += '${element.value}\n';
        }
      }
      return Left(ServerFailure(finalResponse.trim()));
    }
  }

}