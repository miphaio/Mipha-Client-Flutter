import 'package:dio/dio.dart';
import 'package:mipha/proxy/chat/record/outline/get/response.dart';
import 'package:mipha/proxy/client.dart';
import 'package:mipha/util/log.dart';

Future<ChatRecordOutlineGetResponse> callChatRecordOutlineGet(
  final Uri baseUri,
) async {
  final Uri uri = baseUri.resolve("/chat/record/outline?page=0");

  try {
    final Response rawResponse = await getDio().getUri(uri);

    final ChatRecordOutlineGetResponse response =
        ChatRecordOutlineGetResponse.fromJson(rawResponse.data);

    return response;
  } catch (e) {
    logger.error(e);
    rethrow;
  }
}
