import 'package:mipha/proxy/chat/record/get/response.dart';
import 'package:mipha/socket/event/event.dart';
import 'package:mipha/socket/event/event_target_type.dart';
import 'package:mipha/socket/event/event_type.dart';
import 'package:mipha/socket/event/payload/chat_record.dart';
import 'package:mipha/socket/event/payload/chat_record_buffer.dart';
import 'package:mipha/socket/event/payload/chat_record_flush.dart';
import 'package:mipha/socket/event/payload/chat_summarize.dart';
import 'package:mipha/socket/event/payload/chat_touch.dart';
import 'package:mipha/socket/event/payload/connect.dart';
import 'package:mipha/socket/event/payload/echo.dart';
import 'package:mipha/socket/event/payload/error.dart';
import 'package:mipha/socket/event/payload/unknown.dart';

import 'event_target.dart';

WebsocketEvent parseWebsocketEvent(Map<String, dynamic> json) {
  final type = json['type'];
  final metadata = json['metadata'];
  final payload = json['payload'];

  if (type == null || metadata == null) {
    return WebsocketUnknownEvent();
  }

  final WebsocketEventType eventType = WebsocketEventType.fromString(type);

  final metadataTargetType = metadata['targetType'];
  final metadataContent = metadata['content'];

  final WebsocketEventTargetType eventTargetType =
      WebsocketEventTargetType.fromString(metadataTargetType);

  switch (eventType) {
    case WebsocketEventType.chatTouch:
      {
        if (eventTargetType != WebsocketEventTargetType.chatRecord) {
          return WebsocketUnknownEvent();
        }
        return WebsocketChatTouchEvent(
          target: WebsocketEventTarget.fromChatRecord(metadataContent),
          chatRecordIdentifier: payload['chatRecordIdentifier'],
        );
      }
    case WebsocketEventType.chatRecord:
      {
        if (eventTargetType != WebsocketEventTargetType.chatRecord) {
          return WebsocketUnknownEvent();
        }
        return WebsocketChatRecordEvent(
          target: WebsocketEventTarget.fromChatRecord(metadataContent),
          chatRecord: ChatRecordDataStructure.fromJson(
            payload['chatRecord'],
          ),
        );
      }
    case WebsocketEventType.chatRecordBuffer:
      {
        if (eventTargetType != WebsocketEventTargetType.chatRecord) {
          return WebsocketUnknownEvent();
        }
        return WebsocketChatRecordBufferEvent(
          target: WebsocketEventTarget.fromChatRecord(metadataContent),
          content: payload['content'],
        );
      }
    case WebsocketEventType.chatRecordFlush:
      {
        if (eventTargetType != WebsocketEventTargetType.chatRecord) {
          return WebsocketUnknownEvent();
        }
        return WebsocketChatRecordFlushEvent(
          target: WebsocketEventTarget.fromChatRecord(metadataContent),
          content: payload['content'],
        );
      }
    case WebsocketEventType.chatSummarize:
      {
        if (eventTargetType != WebsocketEventTargetType.chatRecord) {
          return WebsocketUnknownEvent();
        }
        return WebsocketChatSummarizeEvent(
          target: WebsocketEventTarget.fromChatRecord(metadataContent),
          version: payload['version'],
          summary: payload['summary'],
        );
      }
    case WebsocketEventType.connect:
      {
        if (eventTargetType != WebsocketEventTargetType.connection) {
          return WebsocketUnknownEvent();
        }
        return WebsocketConnectEvent(
          target: WebsocketEventTarget.fromConnection(metadataContent),
        );
      }
    case WebsocketEventType.echo:
      {
        return WebsocketEchoEvent(
          content: payload['content'],
        );
      }
    case WebsocketEventType.error:
      {
        return WebsocketErrorEvent(
          message: payload['message'],
        );
      }
    default:
      {
        return WebsocketUnknownEvent();
      }
  }
}
