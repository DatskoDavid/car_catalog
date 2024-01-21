import 'package:equatable/equatable.dart';

import '../../../domain/models/car.dart';

class DataState extends Equatable {
  final List<Car> data;

  const DataState({required this.data});

  DataState copyWith({List<Car>? data}) => DataState(data: data ?? this.data);

  @override
  List<Object?> get props => [data];
}
