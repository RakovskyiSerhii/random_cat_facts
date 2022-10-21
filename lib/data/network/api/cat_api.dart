import 'package:dio/dio.dart';
import 'package:random_cat_facts/data/network/dto/fact_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'cat_api.g.dart';

@RestApi(baseUrl: "https://catfact.ninja/")
abstract class CatApi {
  factory CatApi(Dio dio, {String baseUrl}) = _CatApi;

  @GET('fact?max_length={{max_length}}')
  Future<FactDto> getFact();
}
