import 'package:dio/dio.dart';
import 'package:nzaker/core/basics/map_parameters.dart';
import 'package:nzaker/features/results/data/models/country_details_models/country_details_model.dart';
import 'package:nzaker/features/results/data/models/home_models/home_model_response.dart';
import 'package:nzaker/features/results/data/models/result_models/natiga_model.dart';
import 'package:nzaker/features/results/domain/entities/country_details_entities/country_details_entity.dart';
import 'package:nzaker/features/results/domain/entities/result_entities/natiga_entity.dart';

import '../../../../core/error/error_model.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/network_strings.dart';
import '../../domain/entities/home_entities/home_entity_response.dart';

abstract class BaseResultsHomeDataSource{
  Future<HomeEntityResponse> getAllHomeData();
  Future<CountryDetailsEntity> getCountryDetails(String parameters);
  Future<NatigaEntity> getResults(MapParameters parameters);


}


class ResultsHomeDataSource extends BaseResultsHomeDataSource{
  @override
  Future<HomeEntityResponse> getAllHomeData() async{
    try {
      final response = await Dio().get(
          NetworkStrings.homePath,
        queryParameters: {
            'client':'beso',
            'key':'1234'
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return HomeModelResponse.fromJson(response.data);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(e.response!.data));
      } else {
        throw ServerException(
            errorMessageModel:
            ErrorMessageModel.fromJson(const {'name': 'Server Error'}));
      }
    }
    throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(const {'name': 'Error'}));
  }

  @override
  Future<CountryDetailsEntity> getCountryDetails(String parameters) async{
    try {
      final response = await Dio().get(
        NetworkStrings.homePath,
        queryParameters: {
          'client':'beso',
          'key':'1234',
          'id': parameters
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return CountryDetailsModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(e.response!.data));
      } else {
        throw ServerException(
            errorMessageModel:
            ErrorMessageModel.fromJson(const {'name': 'Server Error'}));
      }
    }
    throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(const {'name': 'Error'}));
  }

  @override
  Future<NatigaEntity> getResults(MapParameters parameters) async{
    try {
      final response = await Dio().get(
        NetworkStrings.resultPath,
        queryParameters: {
          'client':'beso',
          'key':'1234',
          'id': parameters.data['city'],
          'k': parameters.data['seatNumber']
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NatigaModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(e.response!.data));
      } else {
        throw ServerException(
            errorMessageModel:
            ErrorMessageModel.fromJson(const {'name': 'Server Error'}));
      }
    }
    throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(const {'name': 'Error'}));
  }
}