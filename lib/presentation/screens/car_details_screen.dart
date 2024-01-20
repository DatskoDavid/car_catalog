import 'package:flutter/material.dart';

import '../../domain/car.dart';
import '../widgets/delete_car_dialog.dart';
import 'edit_car_screen.dart';

class CarDetailsScreen extends StatelessWidget {
  final Car car;

  const CarDetailsScreen({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '${car.company} ${car.model}',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return EditCarScreen(car: car);
                  },
                ),
              ),
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () => _showDeleteCarDialog(context),
              icon: Icon(Icons.delete),
            )
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            SizedBox(
              height: 200,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                child: Image.network(car.image),
              ),
            ),
            _getPadding(10),
            _productProperties(context, 'Price', car.price),
            _getPadding(15),
            _productProperties(context, 'Location', car.location),
            _getPadding(15),
            _productProperties(context, 'Status', car.status),
            _getPadding(20),
          ],
        ),
      ),
    );
  }

  Future _showDeleteCarDialog(
    BuildContext context,
  ) async {
    return showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (context) {
        return DeleteCarDialog(carId: car.id!);
      },
    );
  }

  Widget _getPadding(double height) {
    return SizedBox(height: height);
  }

  Widget _productProperties(BuildContext context, String title, String value) {
    return Padding(
      padding: EdgeInsets.only(
        left: 30,
        right: MediaQuery.of(context).size.width * 0.35,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$title:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 20),
          Text(
            value,
            overflow: TextOverflow.clip,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getProductProperty(BuildContext context, String title, num value) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 45),
        decoration: BoxDecoration(
          border:
              Border.all(color: Color.fromARGB(255, 199, 199, 199), width: 2),
          color: const Color.fromARGB(255, 206, 204, 204),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$title:',
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: 50,
              child: Text(
                title == 'Price' ? '\$$value' : '$value',
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
