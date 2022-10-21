import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:random_cat_facts/core/constants/constants.dart';
import 'package:random_cat_facts/data/local/entity/fact_entity.dart';
import 'package:random_cat_facts/data/mapper/fact_dto_to_model_mapper.dart';
import 'package:random_cat_facts/data/mapper/fact_entity_to_model_mapper.dart';
import 'package:random_cat_facts/data/mapper/fact_model_to_entity_mapper.dart';
import 'package:random_cat_facts/data/network/api/cat_api.dart';
import 'package:random_cat_facts/data/network/repository/repository.dart';
import 'package:random_cat_facts/domain/clear_local_storage_use_case.dart';
import 'package:random_cat_facts/domain/get_fact_use_case.dart';
import 'package:random_cat_facts/domain/get_local_facts_use_case.dart';
import 'package:random_cat_facts/presentation/router/app_router.dart';

class ServiceLocator {
  ServiceLocator._();

  static Future config() async {
    final getIt = GetIt.instance;
    await _configDatabase(getIt);
    _configNetwork(getIt);
    _configMappers(getIt);
    _configUseCase(getIt);
    _configRouter(getIt);
  }

  static void _configUseCase(GetIt getIt) {
    getIt.registerFactory(() => GetFactUseCase(
          getIt.get(),
          getIt.get(),
          getIt.get(),
        ));
    getIt.registerFactory(() => GetLocalFactsUseCase(
          getIt.get(),
          getIt.get(),
        ));
    getIt.registerFactory(() => ClearLocalStorageUseCase(getIt.get()));
  }

  static void _configMappers(GetIt getIt) {
    getIt.registerFactory(() => FactDtoToModelMapper());
    getIt.registerFactory(() => FactModelToEntityMapper());
    getIt.registerFactory(() => FactEntityToModelMapper());
  }

  static void _configNetwork(GetIt getIt) {
    final dio = Dio()
      ..interceptors.add(
        PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90),
      );
    final api = CatApi(dio);
    final repository = Repository(api, getIt.get());

    getIt.registerSingleton(repository);
  }

  static Future _configDatabase(GetIt getIt) async {
    await Hive.initFlutter();
    Hive.registerAdapter<FactEntity>(FactEntityAdapter());
    final box = await Hive.openBox<FactEntity>(Constants.factsBoxName);
    getIt.registerSingleton(box);
  }

  static void _configRouter(GetIt getIt) {
    getIt.registerSingleton(AppRouter());
  }
}
