import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nzaker/core/basics/map_parameters.dart';
import 'package:nzaker/core/components/components.dart';
import 'package:nzaker/core/components/enum.dart';
import 'package:nzaker/features/results/domain/entities/result_entities/natiga_entity.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/use_cases/get_result_use_case.dart';

part 'result_state.dart';

class ResultCubit extends Cubit<ResultState> {
  GetResultUseCase getResultUseCase;
  ResultCubit(this.getResultUseCase) : super(ResultInitial());

  static ResultCubit get(context) => BlocProvider.of(context);
  late List<dynamic> studentData;
   List<dynamic> studentDataKeys = [];
   List<dynamic> studentDataValues = [];


  late List<dynamic> subjectData;
  List<dynamic> subjectDataKeys = [];
  List<dynamic> subjectDataValues = [];


  late NatigaEntity natigaEntity;
  void getResult({required Map<String,dynamic> data}) async{
    emit(ResultWaiting());
    MapParameters mapParameters = MapParameters(data: data);
    final result = await getResultUseCase(mapParameters);
    result.fold((l) {
      showToast(text: l.message, type: ToastTypes.ERROR);
      emit(ResultFetchFailed());
    }, (r) {
      if(r.errorMessage.isEmpty){
        natigaEntity = r;
        studentData = r.results!.studentData.toJson().values.toList()..sort((a, b) => r.results!.studentData.toJson().values.toList().indexOf(a).compareTo(r.results!.studentData.toJson().values.toList().indexOf(b)));
        subjectData = r.results!.subjectDataEntity.toJson().values.toList()..sort((a, b) => r.results!.subjectDataEntity.toJson().values.toList().indexOf(a).compareTo(r.results!.subjectDataEntity.toJson().values.toList().indexOf(b)));
        for(int x = 0; x< studentData.length;x++){
          if(x%2 == 0){
            studentDataKeys.add(studentData[x]);
          }else {
            studentDataValues.add(studentData[x]);
          }
        }
        for(int x = 0; x< subjectData.length;x++){
          if(x%2 == 0){
            subjectDataKeys.add(subjectData[x]);
          }else {
            subjectDataValues.add(subjectData[x]);
          }
        }
        emit(ResultFetchSuccess());
      }else {
        emit(ResultFetchNotValid());
      }
    });
  }
  Future<void> launchMyUrl() async {
    final Uri url = Uri.parse('https://natiga.nezakr.net');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
