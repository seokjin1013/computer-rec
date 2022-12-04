import 'package:clean_architecture_flutter/features/recommend/data/datasources/recommend_remote_data_source.dart';
import 'package:clean_architecture_flutter/features/recommend/data/repositories/recommend_repository_impl.dart';
import 'package:clean_architecture_flutter/features/recommend/domain/repositories/recommend_repository.dart';
import 'package:clean_architecture_flutter/features/recommend/domain/usecases/create_new_account.dart';
import 'package:clean_architecture_flutter/features/recommend/domain/usecases/is_exist_account.dart';
import 'package:clean_architecture_flutter/features/recommend/presentation/provider/signin_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

import 'core/network/network_info.dart';
import 'package:http/http.dart' as http;

import 'features/recommend/presentation/provider/signup_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => SigninProvider(isExistAccount: sl()));
  sl.registerFactory(() => SignupProvider(createNewAccount: sl()));
  sl.registerLazySingleton(() => IsExistAccount(sl()));
  sl.registerLazySingleton(() => CreateNewAccount(sl()));
  sl.registerLazySingleton<RecommendRepository>(() => RecommendRepositoryImpl(
        networkInfo: sl(),
        remoteDataSource: sl(),
      ));
  sl.registerLazySingleton<RecommendRemoteDataSource>(
      () => RecommendRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Connectivity());
}
