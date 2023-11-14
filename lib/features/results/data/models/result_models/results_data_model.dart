import 'package:nzaker/features/results/data/models/result_models/student_data_model.dart';
import 'package:nzaker/features/results/data/models/result_models/subject_data_model.dart';
import 'package:nzaker/features/results/domain/entities/result_entities/results_data_entity.dart';

class ResultsDataModel extends ResultsDataEntity {
  const ResultsDataModel({required super.subjectDataEntity,
    required super.studentData,
    required super.studentDataHeader,
    required super.subjectDataHeader});


  factory ResultsDataModel.fromJson(Map<String, dynamic> json) =>
      ResultsDataModel(
        studentDataHeader: json['studentdataheader'],
        studentData: StudentDataModel.fromJson(json['studentdata']),
          subjectDataHeader: json['subjectsdataheader'],
        subjectDataEntity: SubjectDataModel.fromJson(json['subjectsdata']),
      );
}
