import 'package:nzaker/features/results/domain/entities/country_details_entities/country_details_entity.dart';

class CountryDetailsModel extends CountryDetailsEntity {
  const CountryDetailsModel(
      {required super.headerText, required super.countryDescription});

  factory CountryDetailsModel.fromJson(Map<String, dynamic> json) =>
      CountryDetailsModel(
          headerText: json['headertext'], countryDescription: json['msg']);
}
