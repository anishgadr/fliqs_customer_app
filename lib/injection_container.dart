import 'package:fliqs_app/domain/repository/home_repository.dart';
import 'package:fliqs_app/domain/usecase/home_tab_usecase.dart';
import 'package:fliqs_app/presentation/home/home_tab_bloc/hometab_cubit.dart';
import 'package:get_it/get_it.dart';
import 'data/repository_impl/home_repository_Impl.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerFactory<HometabCubit>(() => HometabCubit(
        homeTopUseCase: sl.call(),
      ));

  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());

  sl.registerLazySingleton<HomeTopUseCase>(
      () => HomeTopUseCase(repository: sl.call()));
}
