import 'package:nzaker/features/results/domain/entities/result_entities/student_data_entity.dart';

class StudentDataModel extends StudentDataEntity {
  const StudentDataModel({required super.d1key,
    required super.d1value,
    required super.d2key,
    required super.d2value,
    required super.d3key,
    required super.d3value,
    required super.d4key,
    required super.d4value,
    required super.d5key,
    required super.d5value,
    required super.d6key,
    required super.d6value,
    required super.d7key,
    required super.d7value,
    required super.d8key,
    required super.d8value,
    required super.d9key,
    required super.d9value,
    required super.d10key,
    required super.d10value});

  factory StudentDataModel.fromJson(Map<String, dynamic> json) =>
      StudentDataModel(
          d1key: json['d1key'],
          d1value: json['d1value'],
          d2key: json['d2key'],
          d2value: json['d2value'],
          d3key: json['d3key'],
          d3value: json['d3value'],
          d4key: json['d4key'],
          d4value: json['d4value'],
          d5key: json['d5key'],
          d5value: json['d5value'],
          d6key: json['d6key'],
          d6value: json['d6value'],
          d7key: json['d7key'],
          d7value: json['d7value'],
          d8key: json['d8key'],
          d8value: json['d8value'],
          d9key: json['d9key'],
          d9value: json['d9value'],
          d10key: json['d10key'],
          d10value: json['d10value']);
}
