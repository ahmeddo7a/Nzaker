part of 'country_details_cubit.dart';

abstract class CountryDetailsState extends Equatable {
  const CountryDetailsState();
}

class CountryDetailsInitial extends CountryDetailsState {
  @override
  List<Object> get props => [];
}
class CountryDetailsWaiting extends CountryDetailsState {
  @override
  List<Object> get props => [];
}
class CountryDetailsFetchDataSuccess extends CountryDetailsState {
  @override
  List<Object> get props => [];
}
class CountryDetailsFetchDataFailed extends CountryDetailsState {
  @override
  List<Object> get props => [];
}
