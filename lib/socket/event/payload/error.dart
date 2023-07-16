import 'package:mipha/socket/event/event.dart';
import 'package:mipha/socket/event/event_target.dart';
import 'package:mipha/socket/event/event_type.dart';

class WebsocketErrorEvent extends WebsocketEvent {
  final String message;

  WebsocketErrorEvent({
    required this.message,
  }) : super(
          eventType: WebsocketEventType.error,
          eventTarget: WebsocketEventTarget.fromVoid(),
        );
}
