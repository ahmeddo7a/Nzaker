import 'package:dartz/dartz.dart';
import 'package:nzaker/features/results/domain/entities/country_details_entities/country_details_entity.dart';

import '../../../../core/basics/base_use_case.dart';
import '../../../../core/error/failure.dart';
import '../repository/base_results_home_repository.dart';

class GetCountryDetailsUseCase extends BaseUseCase<CountryDetailsEntity,String>{
  BaseResultsHomeRepository baseResultsRepository;
  GetCountryDetailsUseCase(this.baseResultsRepository);

  @override
  Future<Either<Failure, CountryDetailsEntity>> call(String parameters) async{
    return await baseResultsRepository.getCountryDetails(parameters);
  }

}