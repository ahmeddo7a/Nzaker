import 'package:get_it/get_it.dart';
import 'package:nzaker/features/results/data/data_source/results_home_data_source.dart';
import 'package:nzaker/features/results/data/repository/results_home_repository.dart';
import 'package:nzaker/features/results/domain/repository/base_results_home_repository.dart';
import 'package:nzaker/features/results/domain/use_cases/get_country_details_use_case.dart';
import 'package:nzaker/features/results/domain/use_cases/get_home_page_data_use_case.dart';
import 'package:nzaker/features/results/domain/use_cases/get_result_use_case.dart';
import 'package:nzaker/features/results/presentation/logic/country_details/country_details_cubit.dart';
import 'package:nzaker/features/results/presentation/logic/result/result_cubit.dart';

import '../../features/results/presentation/logic/home/home_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator{
  void init(){
    //BLOC OR CUBIT
    sl.registerFactory(() => HomeCubit(sl()));
    sl.registerFactory(() => CountryDetailsCubit(sl()));
    sl.registerFactory(() => ResultCubit(sl()));










    // USE CASES

    sl.registerLazySingleton(() => GetHomePageDataUseCase(sl()));
    sl.registerLazySingleton(() => GetCountryDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetResultUseCase(sl()));



    // REPOSITORY
    sl.registerLazySingleton<BaseResultsHomeRepository>(() => ResultsHomeRepository(sl()));


    // DATA SOURCE
    sl.registerLazySingleton<BaseResultsHomeDataSource>(() => ResultsHomeDataSource());


  }
}