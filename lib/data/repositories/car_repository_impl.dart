import 'package:test_task_upwork/domain/repositories/car_repository.dart';

import '../../domain/models/car.dart';
import '../datasources/firestore_datasource.dart';

class CarRepositoryImpl implements CarRepository {
  final FirestoreDatasource firestoreDatasource;

  CarRepositoryImpl(this.firestoreDatasource);

  @override
  Future<List<Car>> getData() async {
    return await firestoreDatasource.getCollection();
  }

  @override
  Future<void> addData(Car car) async {
    return await firestoreDatasource.addCar(car);
  }

  @override
  Future<void> updateData(Car editedCar) async {
    return await firestoreDatasource.updateCar(editedCar);
  }

  @override
  Future<void> deleteData(String id) async {
    return await firestoreDatasource.deleteCar(id);
  }
}
