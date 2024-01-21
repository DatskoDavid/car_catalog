import 'package:cloud_firestore/cloud_firestore.dart';

class Car {
  final String? id;
  final String company;
  final String model;
  final String price;
  final String location;
  final String status;
  final String image;

  Car({
    this.id,
    required this.company,
    required this.model,
    required this.price,
    required this.location,
    required this.status,
    required this.image,
  });

  factory Car.fromFirestore(DocumentSnapshot<Object?> snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return Car(
      id: snapshot.id,
      company: data['company'],
      model: data['model'],
      price: data['price'],
      location: data['location'],
      status: data['status'],
      image: data['image'],
    );
  }

  Map<String, String> toFirestore(
    String company,
    String model,
    String price,
    String location,
    String status,
    String image,
  ) {
    return {
      'company': company,
      'model': model,
      'price': price,
      'location': location,
      'status': status,
      'image': image,
    };
  }
}
