import 'package:nzaker/features/results/domain/entities/result_entities/subject_data_entity.dart';

class SubjectDataModel extends SubjectDataEntity {
  const SubjectDataModel({required super.s1key,
    required super.s1value,
    required super.s2key,
    required super.s2value,
    required super.s3key,
    required super.s3value,
    required super.s4key,
    required super.s4value,
    required super.s5key,
    required super.s5value,
    required super.s6key,
    required super.s6value,
    required super.s7key,
    required super.s7value,
    required super.s8key,
    required super.s8value,
    required super.s9key,
    required super.s9value,
    required super.s10key,
    required super.s10value});

  factory SubjectDataModel.fromJson(Map<String, dynamic> json) =>
      SubjectDataModel(
          s1key: json['s1key'],
          s1value: json['s1value'],
          s2key: json['s2key'],
          s2value: json['s2value'],
          s3key: json['s3key'],
          s3value: json['s3value'],
          s4key: json['s4key'],
          s4value: json['s4value'],
          s5key: json['s5key'],
          s5value: json['s5value'],
          s6key: json['s6key'],
          s6value: json['s6value'],
          s7key: json['s7key'],
          s7value: json['s7value'],
          s8key: json['s8key'],
          s8value: json['s8value'],
          s9key: json['s9key'],
          s9value: json['s9value'],
          s10key: json['s10key'],
          s10value: json['s10value']);
}
