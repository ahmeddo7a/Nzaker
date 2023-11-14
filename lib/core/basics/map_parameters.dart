import 'package:equatable/equatable.dart';

class MapParameters extends Equatable{
  final Map<String,dynamic> data;
  const MapParameters({required this.data});

  @override
  List<Object?> get props => [data];

}