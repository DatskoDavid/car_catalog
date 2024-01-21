import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_task_upwork/domain/di/injector.dart';

import '../bloc/car_bloc/car_bloc.dart';
import '../bloc/car_bloc/car_event.dart';
import '../bloc/car_bloc/car_state.dart';
import '../widgets/car_card.dart';
import '../widgets/sort_dialog.dart';
import 'add_car_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () => _showSortCarsDialog(context),
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<CarBloc, CarState>(
          bloc: injector.get<CarBloc>()..add(InitData()),
          builder: (context, state) {
            return ListView.separated(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return CarCard(car: state.data[index]);
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddCarScreen(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future _showSortCarsDialog(
    BuildContext context,
  ) async {
    return showDialog(
      context: context,
      builder: (context) {
        return SortCarsDialog();
      },
    );
  }
}
