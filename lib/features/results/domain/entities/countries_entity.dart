import 'package:equatable/equatable.dart';

class CountriesEntity extends Equatable{
  final String countryName;
  final String title;

  const CountriesEntity({required this.countryName,required this.title});

  @override
  List<Object?> get props => [countryName,title];
}