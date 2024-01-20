import 'package:flutter/material.dart';
import 'package:test_task_upwork/data/firestore_datasource.dart';
import 'package:test_task_upwork/presentation/widgets/add_car_text_field.dart';

import '../../domain/car.dart';

class AddCarScreen extends StatelessWidget {
  AddCarScreen({super.key});

  final formKey = GlobalKey<FormState>();

  final companyController = TextEditingController();
  final modelController = TextEditingController();
  final priceController = TextEditingController();
  final locationController = TextEditingController();
  final statusController = TextEditingController();
  final imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Car'),
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
                        final car = Car(
                          company: companyController.text,
                          model: modelController.text,
                          price: priceController.text,
                          location: locationController.text,
                          status: statusController.text,
                          image: imageController.text,
                        );
                        FirestoreDatasource().addData(car);
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
                          'Add',
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
