import 'package:equatable/equatable.dart';
import 'package:nzaker/features/results/domain/entities/result_entities/student_data_entity.dart';
import 'package:nzaker/features/results/domain/entities/result_entities/subject_data_entity.dart';

class ResultsDataEntity extends Equatable{
  final String studentDataHeader;
  final StudentDataEntity studentData;
  final String subjectDataHeader;
  final SubjectDataEntity subjectDataEntity;

  const ResultsDataEntity({
    required this.subjectDataEntity,
    required this.studentData,
    required this.studentDataHeader,
    required this.subjectDataHeader
});

  @override
  List<Object?> get props => [
    studentDataHeader,
    studentData,
    subjectDataHeader,
    subjectDataEntity
  ];
}