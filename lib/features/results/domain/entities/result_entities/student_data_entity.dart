import 'package:equatable/equatable.dart';

class StudentDataEntity extends Equatable{
  final String? d1key;
  final String? d1value;
  final String? d2key;
  final String? d2value;
  final String? d3key;
  final String? d3value;
  final String? d4key;
  final String? d4value;
  final String? d5key;
  final String? d5value;
  final String? d6key;
  final String? d6value;
  final String? d7key;
  final String? d7value;
  final String? d8key;
  final String? d8value;
  final String? d9key;
  final String? d9value;
  final String? d10key;
  final String? d10value;
  const StudentDataEntity(
      {required this.d1key,
        required this.d1value,
        required this.d2key,
        required this.d2value,
        required this.d3key,
        required this.d3value,
        required this.d4key,
        required this.d4value,
        required this.d5key,
        required this.d5value,
        required this.d6key,
        required this.d6value,
        required this.d7key,
        required this.d7value,
        required this.d8key,
        required this.d8value,
        required this.d9key,
        required this.d9value,
        required this.d10key,
        required this.d10value});

  @override
  // TODO: implement props
  List<Object?> get props => [
    d1key,
    d1value,
    d2key,
    d2value,
    d3key,
    d3value,
    d4key,
    d4value,
    d5key,
    d5value,
    d6key,
    d6value,
    d7key,
    d7value,
    d8key,
    d8value,
    d9key,
    d9value,
    d10key,
    d10value
  ];

  Map<String, dynamic> toJson() {
    return {
      'd1key': d1key,
      'd1value': d1value,
      'd2key': d2key,
      'd2value': d2value,
      'd3key': d3key,
      'd3value': d3value,
      'd4key': d4key,
      'd4value': d4value,
      'd5key': d5key,
      'd5value': d5value,
      'd6key': d6key,
      'd6value': d6value,
      'd7key': d7key,
      'd7value': d7value,
      'd8key': d8key,
      'd8value': d8value,
      'd9key': d9key,
      'd9value': d9value,
      'd10key': d10key,
      'd10value': d10value,
    };
  }
}