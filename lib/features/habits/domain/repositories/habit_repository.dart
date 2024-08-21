import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/habit.dart';

abstract interface class HabitRepository {
  Future<Either<Failure, List<Habit>>> getAllHabits();
}
