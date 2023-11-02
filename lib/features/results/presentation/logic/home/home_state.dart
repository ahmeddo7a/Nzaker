part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeFetchDataFailed extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeFetchDataSuccess extends HomeState {
  @override
  List<Object> get props => [];
}