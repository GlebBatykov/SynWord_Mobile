import 'package:dio/dio.dart';

abstract class TextFromDocxRemoteRepository {
  Future<String> getTextFromDocx(MultipartFile file);
}
