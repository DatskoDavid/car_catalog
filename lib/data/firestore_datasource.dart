import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../domain/car.dart';

class FirestoreDatasource {
  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('cars');

  Future<List<Car>> getCollection() async {
    QuerySnapshot querySnapshot = await _collectionRef.get();

    final List<Car> allCars =
        querySnapshot.docs.map((car) => Car.fromFirestore(car)).toList();

    return allCars;
  }

  Future<void> addData(Car car) async {
    final docRef = _collectionRef.doc();

    final mappedData = car.toFirestore(
      car.company,
      car.model,
      car.price,
      car.location,
      car.availabilityStatus,
      car.image,
    );

    await docRef.set(mappedData).onError(
          (e, _) => debugPrint("Error writing document: $e"),
        );
  }

  //if edit word in Firestore need to get this word from WordsApi
  Future<void> updateCar(Car car) async {
    final word = _collectionRef.doc(car.id);

    final editedData = car.toFirestore(
      car.company,
      car.model,
      car.price,
      car.location,
      car.availabilityStatus,
      car.image,
    );

    word.update(editedData).then(
          (value) => debugPrint("DocumentSnapshot successfully updated!"),
          onError: (e) => debugPrint("Error updating document $e"),
        );
  }

  Future<void> deleteCar(String id) async {
    _collectionRef.doc(id).delete().then(
          (doc) => debugPrint("Document deleted"),
          onError: (e) => debugPrint("Error updating document $e"),
        );
  }
}
