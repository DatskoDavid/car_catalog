import 'package:cloud_firestore/cloud_firestore.dart';

class Car {
  final String? id;
  final String company;
  final String model;
  final String price;
  final String location;
  final String availabilityStatus;
  final String image;

  Car({
    this.id,
    required this.company,
    required this.model,
    required this.price,
    required this.location,
    required this.availabilityStatus,
    required this.image,
  });

  factory Car.fromFirestore(
    DocumentSnapshot<Object?> snapshot,
    // SnapshotOptions? options,
  ) {
    final data = snapshot.data() as Map<String, dynamic>;

    return Car(
      id: snapshot.id,
      company: data['company'],
      model: data['model'],
      price: data['price'],
      location: data['location'],
      availabilityStatus: data['availabilityStatus'],
      image: data['image'],
    );
  }

  Map<String, dynamic> toFirestore(
    String company,
    String model,
    String price,
    String location,
    String availabilityStatus,
    String image,
  ) {
    return {
      'company': company,
      'model': model,
      'price': price,
      'location': location,
      'availabilityStatus': availabilityStatus,
      'image': image,
    };
  }
}
