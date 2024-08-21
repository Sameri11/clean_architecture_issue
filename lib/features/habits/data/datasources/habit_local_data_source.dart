import 'package:hive/hive.dart';

import '../models/habit_model.dart';

abstract interface class HabitLocalDataSource {
  List<HabitModel> getHabits();
}

class HabitLocalDataSourceImpl implements HabitLocalDataSource {
  final Box<HabitModel> box;
  HabitLocalDataSourceImpl(this.box);

  @override
  List<HabitModel> getHabits() {
    return box.values.toList();
  }
}
