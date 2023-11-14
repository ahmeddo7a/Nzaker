import 'package:equatable/equatable.dart';
import 'package:nzaker/features/results/domain/entities/result_entities/results_data_entity.dart';

class NatigaEntity extends Equatable {
  final String headerText;
  final String message;
  final String errorMessage;
  final ResultsDataEntity? results;

  const NatigaEntity(
      {required this.message, required this.errorMessage, required this.headerText, required this.results});

  @override
  List<Object?> get props => [
    headerText,
    message,
    errorMessage,
    results
  ];

}