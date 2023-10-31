import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nzaker/core/basics/base_use_case.dart';
import 'package:nzaker/core/components/components.dart';
import 'package:nzaker/core/components/enum.dart';
import 'package:nzaker/features/results/domain/entities/home_entity_response.dart';

import '../../domain/use_cases/get_home_page_data_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  GetHomePageDataUseCase getHomePageDataUseCase;
  HomeCubit(this.getHomePageDataUseCase) : super(HomeInitial());
  
  
  static HomeCubit get(context) => BlocProvider.of(context);
  late HomeEntityResponse homeEntityResponse;
  void getHomeData() async{
    
    final result = await getHomePageDataUseCase(const NoParameters());
    result.fold((l) {
      showToast(text: 'حدث خطأ بالاتصال', type: ToastTypes.ERROR);
      emit(HomeFetchDataFailed());
    }, (r) {
      homeEntityResponse = r;
      emit(HomeFetchDataSuccess());
    });
  }
}
