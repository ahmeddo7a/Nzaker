import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nzaker/core/basics/validation_functions.dart';
import 'package:nzaker/core/components/components.dart';
import 'package:nzaker/core/components/enum.dart';
import 'package:nzaker/core/components/resources/string_manager.dart';
import 'package:nzaker/features/results/domain/entities/country_details_entities/country_details_entity.dart';

import '../../../domain/use_cases/get_country_details_use_case.dart';

part 'country_details_state.dart';

class CountryDetailsCubit extends Cubit<CountryDetailsState> {
  GetCountryDetailsUseCase getCountryDetailsUseCase;
  CountryDetailsCubit(this.getCountryDetailsUseCase) : super(CountryDetailsInitial());

  static CountryDetailsCubit get(context) => BlocProvider.of(context);

  CountryDetailsEntity? countryDetails;
  void getCountryDetails(String countryName) async{
    emit(CountryDetailsWaiting());
    final result = await getCountryDetailsUseCase(countryName);
    result.fold((l) {
      showToast(text: AppStrings.serverError, type: ToastTypes.ERROR);
      emit(CountryDetailsFetchDataFailed());
    }, (r) {
      countryDetails = r;
      emit(CountryDetailsFetchDataSuccess());
    });
  }

  String seatNumber = '';
  void searchBySeatNumber({required BuildContext context}) async{
    if(validateSeatNumber(seatNumber)){


    }

  }
}
