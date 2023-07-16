import 'package:mipha/socket/event/event.dart';
import 'package:mipha/socket/event/event_target.dart';
import 'package:mipha/socket/event/event_type.dart';

class WebsocketChatTouchEvent extends WebsocketEvent {
  final String chatRecordIdentifier;

  WebsocketChatTouchEvent({
    required WebsocketEventTarget target,
    required this.chatRecordIdentifier,
  }) : super(
          eventType: WebsocketEventType.chatTouch,
          eventTarget: target,
        );
}
