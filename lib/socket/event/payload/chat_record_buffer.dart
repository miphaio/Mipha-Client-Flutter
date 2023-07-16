import 'package:mipha/socket/event/event.dart';
import 'package:mipha/socket/event/event_target.dart';
import 'package:mipha/socket/event/event_type.dart';

class WebsocketChatRecordBufferEvent extends WebsocketEvent {
  final String content;

  WebsocketChatRecordBufferEvent({
    required WebsocketEventTarget target,
    required this.content,
  }) : super(
          eventType: WebsocketEventType.chatRecordBuffer,
          eventTarget: target,
        );
}
