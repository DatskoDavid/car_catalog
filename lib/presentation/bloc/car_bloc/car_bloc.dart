import 'package:bloc/bloc.dart';
import 'package:test_task_bloc/domain/repositories/data_repository.dart';

import 'data_event.dart';
import 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final DataRepository dataRepository;

  DataBloc(this.dataRepository)
      : super(
          const DataState(
            data: [],
          ),
        ) {
    on<InitData>(_init);
  }

  void _init(InitData event, Emitter<DataState> emit) async {
    final data = await dataRepository.getData();
    emit(state.copyWith(data: data));
  }
}
