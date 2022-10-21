import 'package:random_cat_facts/data/network/repository/repository.dart';

class ClearLocalStorageUseCase {
  final Repository _repository;

  ClearLocalStorageUseCase(this._repository);

  Future<void> invoke() {
    return _repository.clearStorage();
  }
}
