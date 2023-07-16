import 'package:mipha/socket/event/event_target_type.dart';

class WebsocketEventTarget {
  final WebsocketEventTargetType type;
  final String content;

  WebsocketEventTarget({
    required this.type,
    required this.content,
  });

  factory WebsocketEventTarget.fromVoid() {
    return WebsocketEventTarget(
      type: WebsocketEventTargetType.voidType,
      content: "VOID",
    );
  }

  factory WebsocketEventTarget.fromConnection(
    String connectionId,
  ) {
    return WebsocketEventTarget(
      type: WebsocketEventTargetType.connection,
      content: connectionId,
    );
  }

  factory WebsocketEventTarget.fromChatRecord(
    String chatRecordIdentifier,
  ) {
    return WebsocketEventTarget(
      type: WebsocketEventTargetType.chatRecord,
      content: chatRecordIdentifier,
    );
  }

  String toJson() {
    return '{"type": "$type", "content": "$content"}';
  }

  @override
  String toString() {
    return toJson();
  }
}
