import 'package:dio/dio.dart';

import 'authorized_request.dart';

class GetTextFromDocxRequest extends AuthorizedRequest {
  final MultipartFile file;

  GetTextFromDocxRequest({required this.file, required super.token});

  @override
  Map<String, dynamic> getBody() => {'File': file};
}
