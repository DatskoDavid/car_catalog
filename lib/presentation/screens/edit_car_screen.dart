import 'package:flutter/material.dart';
import 'package:test_task_upwork/data/datasources/firestore_datasource.dart';
import 'package:test_task_upwork/presentation/widgets/add_car_text_field.dart';

import '../../domain/di/injector.dart';
import '../../domain/models/car.dart';
import '../bloc/car_bloc/car_bloc.dart';
import '../bloc/car_bloc/car_event.dart';

class EditCarScreen extends StatelessWidget {
  EditCarScreen({super.key, required this.car});

  final Car car;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final companyController = TextEditingController(text: car.company);
    final modelController = TextEditingController(text: car.model);
    final priceController = TextEditingController(text: car.price);
    final locationController = TextEditingController(text: car.location);
    final statusController = TextEditingController(text: car.status);
    final imageController = TextEditingController(text: car.image);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  AddCarTextField(
                    label: 'Company',
                    controller: companyController,
                  ),
                  const SizedBox(height: 10),
                  AddCarTextField(
                    label: 'Model',
                    controller: modelController,
                  ),
                  const SizedBox(height: 10),
                  AddCarTextField(
                    label: 'Price',
                    controller: priceController,
                  ),
                  const SizedBox(height: 10),
                  AddCarTextField(
                    label: 'Location',
                    controller: locationController,
                  ),
                  const SizedBox(height: 10),
                  AddCarTextField(
                    label: 'Status',
                    controller: statusController,
                  ),
                  const SizedBox(height: 10),
                  AddCarTextField(
                    label: 'Image (link)',
                    controller: imageController,
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        final newCar = Car(
                          id: car.id,
                          company: companyController.text,
                          model: modelController.text,
                          price: priceController.text,
                          location: locationController.text,
                          status: statusController.text,
                          image: imageController.text,
                        );
                        injector.get<CarBloc>().add(EditCar(car: newCar));
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 62, 124, 64),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
