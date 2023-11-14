import 'package:equatable/equatable.dart';

class SubjectDataEntity extends Equatable{
  final String? s1key;
  final String? s1value;
  final String? s2key;
  final String? s2value;
  final String? s3key;
  final String? s3value;
  final String? s4key;
  final String? s4value;
  final String? s5key;
  final String? s5value;
  final String? s6key;
  final String? s6value;
  final String? s7key;
  final String? s7value;
  final String? s8key;
  final String? s8value;
  final String? s9key;
  final String? s9value;
  final String? s10key;
  final String? s10value;
  const SubjectDataEntity(
      {required this.s1key,
        required this.s1value,
        required this.s2key,
        required this.s2value,
        required this.s3key,
        required this.s3value,
        required this.s4key,
        required this.s4value,
        required this.s5key,
        required this.s5value,
        required this.s6key,
        required this.s6value,
        required this.s7key,
        required this.s7value,
        required this.s8key,
        required this.s8value,
        required this.s9key,
        required this.s9value,
        required this.s10key,
        required this.s10value});

  @override
  List<Object?> get props => [
    s1key,
    s1value,
    s2key,
    s2value,
    s3key,
    s3value,
    s4key,
    s4value,
    s5key,
    s5value,
    s6key,
    s6value,
    s7key,
    s7value,
    s8key,
    s8value,
    s9key,
    s9value,
    s10key,
    s10value
  ];


  Map<String, dynamic> toJson() {
    return {
      's1key': s1key,
      's1value': s1value,
      's2key': s2key,
      's2value': s2value,
      's3key': s3key,
      's3value': s3value,
      's4key': s4key,
      's4value': s4value,
      's5key': s5key,
      's5value': s5value,
      's6key': s6key,
      's6value': s6value,
      's7key': s7key,
      's7value': s7value,
      's8key': s8key,
      's8value': s8value,
      's9key': s9key,
      's9value': s9value,
      's10key': s10key,
      's10value': s10value,
    };
  }
}