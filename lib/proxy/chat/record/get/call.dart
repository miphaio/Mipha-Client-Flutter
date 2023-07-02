import 'package:dio/dio.dart';
import 'package:mipha/util/log.dart';

import '../../../client.dart';
import 'response.dart';

Future<ChatRecordGetResponse> callChatRecordGet(
  final Uri baseUri,
) async {
  final Uri uri = baseUri.resolve("/chat/record/get");

  try {
    final Response rawResponse = await dio.getUri(uri);

    final ChatRecordGetResponse response =
        ChatRecordGetResponse.fromJson(rawResponse.data);

    return response;
  } catch (e) {
    logger.error(e);
    rethrow;
  }
}
