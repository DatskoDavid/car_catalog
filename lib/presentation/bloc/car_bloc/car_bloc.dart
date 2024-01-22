import 'package:bloc/bloc.dart';

import '../../../domain/repositories/car_repository.dart';
import 'car_event.dart';
import 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final CarRepository carRepository;

  CarBloc(this.carRepository)
      : super(
          const CarState(
            data: [],
          ),
        ) {
    on<InitData>(_init);
    on<AddCar>(_add);
    on<EditCar>(_edit);
    on<DeleteCar>(_delete);
    on<SortCarsByPrice>(_sortCarsByPrice);
    on<SortCarsByAlphabet>(_sortCarsByAlphabet);
    on<FilterCarsByCompany>(_filterCarsByCompany);
  }

  void _init(InitData event, Emitter<CarState> emit) async {
    final data = await carRepository.getData();
    emit(state.copyWith(data: data));
  }

  void _add(AddCar event, Emitter<CarState> emit) async {
    await carRepository.addData(event.car);
    final data = await carRepository.getData();
    emit(state.copyWith(data: data));
  }

  void _edit(EditCar event, Emitter<CarState> emit) async {
    await carRepository.updateData(event.car);
    final data = await carRepository.getData();
    emit(state.copyWith(data: data));
  }

  void _delete(DeleteCar event, Emitter<CarState> emit) async {
    await carRepository.deleteData(event.id);
    final data = await carRepository.getData();
    emit(state.copyWith(data: data));
  }

  void _sortCarsByAlphabet(SortCarsByAlphabet event, Emitter<CarState> emit) {
    final data = state.data;
    data.sort((a, b) => a.company.compareTo(b.company));
    emit(state.copyWith(data: data));
  }

  void _sortCarsByPrice(SortCarsByPrice event, Emitter<CarState> emit) {
    final data = state.data;
    data.sort((a, b) => int.parse(a.price).compareTo(int.parse(b.price)));
    emit(state.copyWith(data: data));
  }

  void _filterCarsByCompany(
      FilterCarsByCompany event, Emitter<CarState> emit) async {
    final data = await carRepository.getData();
    data.removeWhere((element) => element.company != event.filterData);
    emit(state.copyWith(data: data));
  }
}
