import 'package:mipha/socket/event/event.dart';
import 'package:mipha/socket/event/event_target.dart';
import 'package:mipha/socket/event/event_type.dart';

class WebsocketChatRecordFlushEvent extends WebsocketEvent {
  final String content;

  WebsocketChatRecordFlushEvent({
    required WebsocketEventTarget target,
    required this.content,
  }) : super(
          eventType: WebsocketEventType.chatRecordBuffer,
          eventTarget: target,
        );
}
