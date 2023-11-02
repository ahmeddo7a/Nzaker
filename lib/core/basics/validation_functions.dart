import 'package:nzaker/core/components/components.dart';
import 'package:nzaker/core/components/enum.dart';

import '../components/resources/string_manager.dart';

bool validateSeatNumber (String seatNumber){
  if(seatNumber.isEmpty){
    showToast(text: AppStrings.pleaseEnterSeatNumber, type: ToastTypes.ERROR);
    return false;
  }else if(!isNumeric(seatNumber)){
    showToast(text: AppStrings.pleaseEnterValidSeatNumber, type: ToastTypes.ERROR);
    return false;
  }
  return true;
}

bool isNumeric(String str) {
  return RegExp(r'^[0-9]+$').hasMatch(str);
}