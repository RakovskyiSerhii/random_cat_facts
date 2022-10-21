abstract class Mapper<IN, OUT> {
  OUT map(IN inModel);
}

mixin ListMapperMixin<IN, OUT> on Mapper<IN, OUT> {
  List<OUT> mapList(List<IN> inList) {
    return inList.map(map).toList();
  }
}

abstract class BaseMapper<IN, OUT> extends Mapper<IN, OUT>
    with ListMapperMixin<IN, OUT> {}
