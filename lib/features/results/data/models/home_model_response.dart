import 'package:nzaker/features/results/data/models/countries_model.dart';
import 'package:nzaker/features/results/domain/entities/home_entity_response.dart';

class HomeModelResponse extends HomeEntityResponse {
  const HomeModelResponse(
      {required super.headerText,
      required super.details,
      required super.countries});

  factory HomeModelResponse.fromJson(Map<String, dynamic> json) =>
      HomeModelResponse(
          headerText: json['headertext'],
          details: json['msg'],
          countries: List<CountriesModel>.from(
              json['results'].map((x) => CountriesModel.fromJson(x))));
}
