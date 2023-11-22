import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nzaker/core/components/resources/string_manager.dart';
import 'package:nzaker/core/services/notification_services.dart';

import '../../../../../core/basics/base_use_case.dart';
import '../../../../../core/components/components.dart';
import '../../../../../core/components/enum.dart';
import '../../../domain/entities/home_entities/home_entity_response.dart';
import '../../../domain/use_cases/get_home_page_data_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  GetHomePageDataUseCase getHomePageDataUseCase;
  HomeCubit(this.getHomePageDataUseCase) : super(HomeInitial());

  NotificationServices notificationServices = NotificationServices();

  static HomeCubit get(context) => BlocProvider.of(context);
  late HomeEntityResponse homeEntityResponse;
  void getHomeData() async{
  notificationServices.getDeviceToken().then((value) {
    debugPrint("Device Token is : $value");
  });
  notificationServices.firebaseInit();
    final result = await getHomePageDataUseCase(const NoParameters());
    result.fold((l) {
      showToast(text: AppStrings.serverError, type: ToastTypes.ERROR);
      emit(HomeFetchDataFailed());
    }, (r) {
      homeEntityResponse = r;
      emit(HomeFetchDataSuccess());
    });
  }
}
