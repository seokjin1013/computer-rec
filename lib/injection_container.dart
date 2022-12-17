import 'package:clean_architecture_flutter/features/recommend/data/models/computer_item_model.dart';
import 'package:clean_architecture_flutter/features/recommend/domain/entities/milestone.dart';
import 'package:clean_architecture_flutter/features/recommend/presentation/widgets/computer_item_display2.dart';
import 'package:clean_architecture_flutter/features/recommend/presentation/widgets/milestone_display.dart';

import 'features/recommend/domain/entities/computer_item.dart';
import 'features/recommend/domain/usecases/get_computer_item_hit%20copy.dart';
import 'features/recommend/domain/usecases/get_computer_item_hit.dart';
import 'features/recommend/domain/usecases/get_computer_program_fit.dart';
import 'features/recommend/domain/usecases/get_milestone.dart';
import 'features/recommend/domain/usecases/get_recommend_output.dart';
import 'features/recommend/domain/usecases/get_today_tip.dart';
import 'features/recommend/presentation/provider/recommend_input_provider.dart';

import 'core/user/user_info.dart';
import 'features/recommend/data/datasources/recommend_local_data_source.dart';
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

import 'features/recommend/presentation/provider/recommend_output_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ComputerItem computerItem = ComputerCPUModel.fromJson({
  //   "id": 16101353,
  //   "name": "인텔 코어i5-12세대 12400F (엘더레이크) (정품)",
  //   "image":
  //       "https://img.danawa.com/prod_img/500000/353/101/img/16101353_1.jpg?shrink=330:330&_v=20220825172644",
  //   "price": 248530,
  //   "rank": 8,
  //   "shopLink":
  //       "https://prod.danawa.com/bridge/loadingBridge.html?cate1=861&cate2=873&cate3=959&cate4=0&pcode=16101353&cmpnyc=TH201&safe_trade=4&fee_type=T&link_pcode=4724320290&package=0&setpc=0&r=16678519296311",
  //   "shopName": "11번가",
  //   "shopLogo": "https://img.danawa.com/cmpny_info/images/TH201_logo.gif",
  //   "socket": "인텔(소켓1700)",
  //   "score": 4.8,
  //   "totalScore": 92.2,
  //   "happyId": 10969556,
  //   "happyPrice": 234000,
  //   "manufacturer": "인텔",
  //   "tcp": "65~117W",
  //   "maxClock": "4.4GHz",
  //   "numCore": "6코어",
  //   "numThread": "12쓰레드",
  //   "memoryType": "DDR5, DDR4",
  //   "details":
  //       '[{"manufacturer": "인텔"}, {"tcp": "65~117W"}, {"maxClock": "4.4GHz"}, {"numCore": "6코어"}, {"numThread": "12쓰레드"}, {"memoryType": "DDR5, DDR4"}]',
  //   "hits": 0,
  // });
  // sl.registerLazySingleton(() => ComputerItemDisplay2(sl()));
  // sl.registerLazySingleton(() => computerItem);
  sl.registerLazySingleton(() => MilestoneDisplay(sl()));
  sl.registerLazySingleton(() => Milestone(numUser: 0, numUsage: 0));

  sl.registerFactory(() => MainProvider(sl(), sl(), sl(), sl()));
  sl.registerFactory(() => RecommendInputProvider());
  sl.registerFactory(() => RecommendOutputProvider(
      sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl()));
  sl.registerLazySingleton(() => GetTodayTip(sl()));
  sl.registerLazySingleton(() => GetComputerProgramFit(sl()));
  sl.registerLazySingleton(() => GetBottleneckCPUVGA(sl()));
  sl.registerLazySingleton(() => GetRecommendOutput(sl()));
  sl.registerLazySingleton(() => GetMilestone(sl()));
  sl.registerLazySingleton(() => GetComputerCPUIdHit(sl()));
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
        localDataSource: sl(),
        remoteDataSource: sl(),
      ));
  sl.registerLazySingleton<RecommendLocalDataSource>(
      () => RecommendLocalDataSourceImpl());
  sl.registerLazySingleton<RecommendRemoteDataSource>(
      () => RecommendRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => UserInfo());
}
