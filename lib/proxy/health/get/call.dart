import 'package:dio/dio.dart';
import 'package:mipha/util/log.dart';

import '../../client.dart';
import 'response.dart';

Future<HealthGetResponse> callHealthGet(
  final Uri baseUri,
) async {
  final Uri uri = baseUri.resolve("/health/get");

  try {
    final Response rawResponse = await dio.getUri(uri);

    final HealthGetResponse response =
        HealthGetResponse.fromJson(rawResponse.data);

    return response;
  } catch (e) {
    logger.error(e);
    rethrow;
  }
}
