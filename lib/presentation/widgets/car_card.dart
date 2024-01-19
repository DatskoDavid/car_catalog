import 'package:flutter/material.dart';

import '../../domain/car.dart';
import '../screens/car_details_screen.dart';

class CarCard extends StatelessWidget {
  const CarCard({
    super.key,
    required this.car,
    // required this.updateData,
    // required this.deleteData,
  });

  final Car car;
  // final Function() updateData;
  // final Function() deleteData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CarDetailsScreen(car: car),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 206, 205, 205),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Image.network(car.image),
            Row(children: [
              Text(
                car.company,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 5),
              Text(
                car.model,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                car.price,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                car.location,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
