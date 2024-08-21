import 'package:hive/hive.dart';

import '../../domain/entities/habit.dart';

part 'habit_model.g.dart';

@HiveType(typeId: 0)
class HabitModel extends Habit {
  @HiveField(0)
  final String name;

  HabitModel({required this.name}) : super(name: name);

  Habit toEntity() => Habit(name: name);
}
