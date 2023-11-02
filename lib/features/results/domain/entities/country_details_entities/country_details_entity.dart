import 'package:equatable/equatable.dart';

class CountryDetailsEntity extends Equatable{
  final String headerText;
  final String countryDescription;

  const CountryDetailsEntity({required this.headerText,required this.countryDescription});

  @override
  List<Object?> get props => [headerText,countryDescription];
}