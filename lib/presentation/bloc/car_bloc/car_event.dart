import 'package:equatable/equatable.dart';

import '../../../domain/models/car.dart';

abstract class CarEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitData extends CarEvent {
  InitData();
}

class AddCar extends CarEvent {
  final Car car;
  AddCar({required this.car});
}

class EditCar extends CarEvent {
  final Car car;
  EditCar({required this.car});
}

class DeleteCar extends CarEvent {
  final String id;
  DeleteCar({required this.id});
}

class SortCarsByAlphabet extends CarEvent {
  SortCarsByAlphabet();
}

class SortCarsByPrice extends CarEvent {
  SortCarsByPrice();
}
