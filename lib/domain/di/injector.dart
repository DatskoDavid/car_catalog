import 'package:get_it/get_it.dart';
import 'package:test_task_upwork/data/datasources/firestore_datasource.dart';

import '../../data/repositories/car_repository_impl.dart';
import '../../presentation/bloc/car_bloc/car_bloc.dart';
import '../repositories/car_repository.dart';

GetIt get injector => GetIt.instance;

void initInjector() {
  _initDataSources();
  _initRepositories();
  _initBlocs();
}

void _initDataSources() {
  injector.registerSingleton<FirestoreDatasource>(FirestoreDatasource());
}

void _initRepositories() {
  injector.registerSingleton<CarRepository>(CarRepositoryImpl(injector.get()));
}

void _initBlocs() {
  injector.registerSingleton<CarBloc>(CarBloc(injector.get()));
}
