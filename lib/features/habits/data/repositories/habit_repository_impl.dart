import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:test_clean_architecture/features/habits/data/datasources/habit_local_data_source.dart';
import 'package:test_clean_architecture/features/habits/domain/repositories/habit_repository.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/habit.dart';

class HabitRepositoryImpl implements HabitRepository {
  final HabitLocalDataSource habitLocalDataSource;
  HabitRepositoryImpl(this.habitLocalDataSource);

  @override
  Future<Either<Failure, List<Habit>>> getAllHabits() async {
    try {
      final habitModels = habitLocalDataSource.getHabits();
      List<Habit> habits = habitModels.map((model) => model.toEntity()).toList();
      return right(habits);
    } on HiveError catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
