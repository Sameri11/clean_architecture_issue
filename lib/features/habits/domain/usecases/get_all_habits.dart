import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/habit.dart';
import '../repositories/habit_repository.dart';

class GetAllHabits implements UseCase<List<Habit>, NoParams> {
  final HabitRepository habitRepository;
  GetAllHabits(this.habitRepository);

  @override
  Future<Either<Failure, List<Habit>>> call(NoParams params) async {
    return await habitRepository.getAllHabits();
  }

}
