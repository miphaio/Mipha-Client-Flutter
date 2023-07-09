import 'package:dio/dio.dart';
import 'package:mipha/proxy/chat/record/get/response.dart';
import 'package:mipha/proxy/client.dart';
import 'package:mipha/util/log.dart';

Future<ChatRecordGetResponse> callChatRecordGet(
  final Uri baseUri,
  final String chatRecordIdentifier,
) async {
  final Uri uri = baseUri.resolve(
    "/chat/record?identifier=$chatRecordIdentifier",
  );

  try {
    final Response rawResponse = await getDio().getUri(uri);

    final ChatRecordGetResponse response =
        ChatRecordGetResponse.fromJson(rawResponse.data);

    return response;
  } catch (e) {
    logger.error(e);
    rethrow;
  }
}
