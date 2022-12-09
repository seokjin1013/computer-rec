import 'package:clean_architecture_flutter/features/recommend/domain/usecases/get_milestone.dart';

import 'core/user/user_info.dart';
import 'features/recommend/domain/usecases/get_computer_item.dart';

import 'features/recommend/data/datasources/recommend_remote_data_source.dart';
import 'features/recommend/data/repositories/recommend_repository_impl.dart';
import 'features/recommend/domain/repositories/recommend_repository.dart';
import 'features/recommend/domain/usecases/get_computer_item_best_range.dart';
import 'features/recommend/domain/usecases/post_new_account.dart';
import 'features/recommend/domain/usecases/is_exist_account.dart';
import 'features/recommend/presentation/provider/main_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

import 'core/network/network_info.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => MainProvider(sl(), sl(), sl()));
  sl.registerLazySingleton(() => GetMilestone(sl()));
  sl.registerLazySingleton(() => GetComputerCPUIdBestRange(sl()));
  sl.registerLazySingleton(() => GetComputerCPU(sl()));
  sl.registerLazySingleton(() => GetComputerVGA(sl()));
  sl.registerLazySingleton(() => GetComputerRAM(sl()));
  sl.registerLazySingleton(() => GetComputerMainBoard(sl()));
  sl.registerLazySingleton(() => GetComputerSSD(sl()));
  sl.registerLazySingleton(() => GetComputerHDD(sl()));
  sl.registerLazySingleton(() => GetComputerCooler(sl()));
  sl.registerLazySingleton(() => GetComputerPower(sl()));
  sl.registerLazySingleton(() => GetComputerCase(sl()));
  sl.registerLazySingleton(() => IsExistAccount(sl()));
  sl.registerLazySingleton(() => PostNewAccount(sl()));
  sl.registerLazySingleton<RecommendRepository>(() => RecommendRepositoryImpl(
        networkInfo: sl(),
        remoteDataSource: sl(),
      ));
  sl.registerLazySingleton<RecommendRemoteDataSource>(
      () => RecommendRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => UserInfo());
}
