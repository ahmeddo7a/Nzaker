import 'package:dartz/dartz.dart';
import 'package:nzaker/core/basics/map_parameters.dart';
import 'package:nzaker/features/results/domain/entities/result_entities/natiga_entity.dart';

import '../../../../core/basics/base_use_case.dart';
import '../../../../core/error/failure.dart';
import '../repository/base_results_home_repository.dart';

class GetResultUseCase extends BaseUseCase<NatigaEntity,MapParameters>{
  BaseResultsHomeRepository baseResultsRepository;
  GetResultUseCase(this.baseResultsRepository);

  @override
  Future<Either<Failure, NatigaEntity>> call(MapParameters parameters) async{
    return await baseResultsRepository.getResults(parameters);
  }

}