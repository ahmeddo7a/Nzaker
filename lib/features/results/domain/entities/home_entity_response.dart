import 'package:equatable/equatable.dart';
import 'package:nzaker/features/results/domain/entities/countries_entity.dart';

class HomeEntityResponse extends Equatable{
  final String headerText;
  final String details;
  final List<CountriesEntity> countries;

  const HomeEntityResponse({required this.headerText,required this.details, required this.countries});

  @override
  List<Object?> get props => [headerText,details,countries];
}