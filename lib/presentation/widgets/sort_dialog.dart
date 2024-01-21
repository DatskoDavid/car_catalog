import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/di/injector.dart';
import '../bloc/car_bloc/car_bloc.dart';
import '../bloc/car_bloc/car_event.dart';

class SortCarsDialog extends StatefulWidget {
  SortCarsDialog({super.key});

  @override
  State<SortCarsDialog> createState() => _SortCarsDialogState();
}

class _SortCarsDialogState extends State<SortCarsDialog> {
  bool sortAlphabetically = false;
  bool sortByPrice = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Sort cars',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Checkbox(
                value: sortAlphabetically,
                onChanged: (value) {
                  setState(() {
                    sortAlphabetically = !sortAlphabetically;
                    if (sortAlphabetically) {
                      sortByPrice = false;
                    }
                  });
                },
              ),
              Text(
                'Alphabetically',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Checkbox(
                value: sortByPrice,
                onChanged: (value) {
                  setState(() {
                    sortByPrice = !sortByPrice;
                    if (sortByPrice) {
                      sortAlphabetically = false;
                    }
                  });
                },
              ),
              Text(
                'By price',
                style: TextStyle(fontSize: 16),
              ),
            ],
          )
        ],
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 70, 172, 87),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () async {
                  if (sortAlphabetically) {
                    injector.get<CarBloc>().add(SortCarsByAlphabet());
                  }
                  if (sortByPrice) {
                    injector.get<CarBloc>().add(SortCarsByPrice());
                  }
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Apply',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
