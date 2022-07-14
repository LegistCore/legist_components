import 'package:get_it/get_it.dart';

class DiContainer{
static registerDependencies() {
  final getIt = GetIt.instance;
  }

  _registerStores(GetIt getIt) {}
  _registerDatasource(GetIt getIt) {}
  _registerRepositories(GetIt getIt) {}
  _registerUseCases(GetIt getIt) {}
}