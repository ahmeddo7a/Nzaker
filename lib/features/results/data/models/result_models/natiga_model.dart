import 'package:nzaker/features/results/data/models/result_models/results_data_model.dart';
import 'package:nzaker/features/results/domain/entities/result_entities/natiga_entity.dart';

class NatigaModel extends NatigaEntity {
  const NatigaModel({required super.message,
    required super.errorMessage,
    required super.headerText,
    super.results});

  factory NatigaModel.fromJson(Map<String, dynamic> json) =>
      NatigaModel(message: json['msg'],
          errorMessage: json['errormsg'],
          headerText: json['headertext'],
          results:(json['errormsg'].toString().isEmpty)? ResultsDataModel.fromJson(json['results']) : null
      );
}
