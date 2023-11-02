import 'package:dartz/dartz.dart';
import 'package:nzaker/features/results/domain/repository/base_results_home_repository.dart';

import '../../../../core/basics/base_use_case.dart';
import '../../../../core/error/failure.dart';
import '../entities/home_entities/home_entity_response.dart';

class GetHomePageDataUseCase extends BaseUseCase<HomeEntityResponse,NoParameters>{
  BaseResultsHomeRepository baseResultsRepository;
  GetHomePageDataUseCase(this.baseResultsRepository);

  @override
  Future<Either<Failure, HomeEntityResponse>> call(NoParameters parameters) async{
    return await baseResultsRepository.getHomePageData();
  }

}