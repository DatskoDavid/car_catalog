import 'package:test_task_upwork/domain/models/car.dart';

abstract class CarRepository {
  Future<List<Car>> getData();
  Future<void> addData(Car car);
  Future<void> updateData(Car editedCar);
  Future<void> deleteData(String id);
}
