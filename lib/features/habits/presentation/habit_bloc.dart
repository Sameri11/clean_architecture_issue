import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_clean_architecture/features/habits/domain/entities/habit.dart';

import '../../../core/usecase/usecase.dart';
import '../domain/usecases/get_all_habits.dart';

part 'habit_event.dart';
part 'habit_state.dart';

class HabitBloc extends Bloc<HabitEvent, HabitState> {
  final GetAllHabits _getAllHabits;

  HabitBloc({required GetAllHabits getAllHabits})
      : _getAllHabits = getAllHabits,
        super(HabitInitial()) {
    on<HabitEvent>((event, emit) => emit(HabitLoading()));
    on<HabitGetAllHabits>(_onHabitGetAllHabits);
  }

  void _onHabitGetAllHabits(HabitGetAllHabits event, Emitter<HabitState> emit) async {
    final res = await _getAllHabits(NoParams());
    res.fold((l) => emit(HabitFailure(l.message)), (r) => emit(HabitGetAllSuccess(r)));
  }
}
