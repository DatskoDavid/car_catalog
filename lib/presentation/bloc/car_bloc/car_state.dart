import 'package:equatable/equatable.dart';

import '../../../domain/models/car.dart';

class CarState {
  final List<Car> data;

  const CarState({required this.data});

  CarState copyWith({List<Car>? data}) => CarState(data: data ?? this.data);
}
