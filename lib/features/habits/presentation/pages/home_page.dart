import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../habit_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HabitBloc>().add(HabitGetAllHabits());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HabitBloc, HabitState>(
        listener: (context, state) {
          if (state is HabitFailure) {
            print("failure");
          }
        },
        builder: (context, state) {
          if (state is HabitLoading) {
            return const CircularProgressIndicator();
          }

          if (state is HabitGetAllSuccess) {
            return const Text("HabitGetAllSuccess");
          }

          return const Text("No habits yet");
        }
      )
    );
  }
}
