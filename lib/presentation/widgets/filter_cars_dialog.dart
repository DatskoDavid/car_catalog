import 'package:flutter/material.dart';

import '../../domain/di/injector.dart';
import '../bloc/car_bloc/car_bloc.dart';
import '../bloc/car_bloc/car_event.dart';

class FilterCarsDialog extends StatefulWidget {
  const FilterCarsDialog({super.key});

  @override
  State<FilterCarsDialog> createState() => _SortCarsDialogState();
}

class _SortCarsDialogState extends State<FilterCarsDialog> {
  bool filterAudi = false;
  bool filterBMW = false;
  bool filterVW = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Filter cars',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'By company:',
            style: TextStyle(fontSize: 16),
          ),
          Row(
            children: [
              Checkbox(
                value: filterAudi,
                onChanged: (value) {
                  setState(() {
                    filterAudi = !filterAudi;
                    if (filterAudi) {
                      filterBMW = false;
                      filterVW = false;
                    }
                  });
                },
              ),
              Text(
                'Audi',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: filterBMW,
                onChanged: (value) {
                  setState(() {
                    filterBMW = !filterBMW;
                    if (filterBMW) {
                      filterAudi = false;
                      filterVW = false;
                    }
                  });
                },
              ),
              Text(
                'BMW',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: filterVW,
                onChanged: (value) {
                  setState(() {
                    filterVW = !filterVW;
                    if (filterVW) {
                      filterAudi = false;
                      filterBMW = false;
                    }
                  });
                },
              ),
              Text(
                'VW',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
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
                  String filterData = '';
                  if (filterAudi) {
                    filterData = 'Audi';
                  } else if (filterBMW) {
                    filterData = 'BMW';
                  } else if (filterVW) {
                    filterData = 'Volkswagen';
                  }
                  injector
                      .get<CarBloc>()
                      .add(FilterCarsByCompany(filterData: filterData));
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
