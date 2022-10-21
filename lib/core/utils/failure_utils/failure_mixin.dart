import 'package:random_cat_facts/core/failure/failure.dart';

mixin FailureMixin {
  void handleFailure(dynamic failure) {
    if (failure is Failure) {
      processFailure(failure);
    }
  }

  void processFailure(Failure failure);
}
