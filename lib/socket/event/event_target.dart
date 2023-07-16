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

  factory WebsocketEventTarget.fromString(
    String type,
    String content,
  ) {
    return WebsocketEventTarget(
      type: WebsocketEventTargetType.fromString(
        type,
      ),
      content: content,
    );
  }
}
