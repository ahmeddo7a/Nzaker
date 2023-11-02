import 'package:nzaker/features/results/domain/entities/home_entities/countries_entity.dart';

class CountriesModel extends CountriesEntity {
  const CountriesModel({required super.countryName, required super.title});

  factory CountriesModel.fromJson(Map<String, dynamic> json) =>
      CountriesModel(countryName: json['id'], title: json['title']);
}