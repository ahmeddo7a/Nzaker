part of 'result_cubit.dart';

abstract class ResultState extends Equatable {
  const ResultState();
}

class ResultInitial extends ResultState {
  @override
  List<Object> get props => [];
}
class ResultWaiting extends ResultState {
  @override
  List<Object> get props => [];
}
class ResultFetchSuccess extends ResultState {
  @override
  List<Object> get props => [];
}

class ResultFetchFailed extends ResultState {
  @override
  List<Object> get props => [];
}
class ResultFetchNotValid extends ResultState {
  @override
  List<Object> get props => [];
}