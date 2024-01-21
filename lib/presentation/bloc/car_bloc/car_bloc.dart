import 'package:bloc/bloc.dart';

import '../../../domain/repositories/car_repository.dart';
import 'car_event.dart';
import 'car_state.dart';

class CarBloc extends Bloc<CarEvent, DataState> {
  final CarRepository carRepository;

  CarBloc(this.carRepository)
      : super(
          const DataState(
            data: [],
          ),
        ) {
    on<InitData>(_init);
    on<AddCar>(_add);
    on<EditCar>(_edit);
    on<DeleteCar>(_delete);
  }

  void _init(InitData event, Emitter<DataState> emit) async {
    final data = await carRepository.getData();
    emit(state.copyWith(data: data));
  }

  void _add(AddCar event, Emitter<DataState> emit) async {
    await carRepository.addData(event.car);
    final data = await carRepository.getData();
    emit(state.copyWith(data: data));
  }

  void _edit(EditCar event, Emitter<DataState> emit) async {
    await carRepository.updateData(event.car);
    final data = await carRepository.getData();
    emit(state.copyWith(data: data));
  }

  void _delete(DeleteCar event, Emitter<DataState> emit) async {
    await carRepository.deleteData(event.id);
    final data = await carRepository.getData();
    emit(state.copyWith(data: data));
  }
}
