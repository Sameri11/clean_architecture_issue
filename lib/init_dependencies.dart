import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'features/habits/data/datasources/habit_local_data_source.dart';
import 'features/habits/data/models/habit_model.dart';
import 'features/habits/data/repositories/habit_repository_impl.dart';
import 'features/habits/domain/repositories/habit_repository.dart';
import 'features/habits/domain/usecases/get_all_habits.dart';
import 'features/habits/presentation/habit_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  _initHabit();

  Hive.init((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(HabitModelAdapter());
  final habitsBox = await Hive.openBox<HabitModel>("habits");
  sl.registerLazySingleton(() => habitsBox);
}

void _initHabit() {
  sl
    // Formatter made me do it.
    ..registerFactory<HabitLocalDataSource>(
        () => HabitLocalDataSourceImpl(sl()))
    ..registerFactory<HabitRepository>(() => HabitRepositoryImpl(sl()))
    ..registerFactory<GetAllHabits>(() => GetAllHabits(sl()))
    ..registerLazySingleton<HabitBloc>(() => HabitBloc(getAllHabits: sl()));
}
