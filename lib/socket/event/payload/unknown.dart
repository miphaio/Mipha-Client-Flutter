import 'package:mipha/socket/event/event.dart';
import 'package:mipha/socket/event/event_target.dart';
import 'package:mipha/socket/event/event_type.dart';

class WebsocketUnknownEvent extends WebsocketEvent {
  WebsocketUnknownEvent()
      : super(
          eventType: WebsocketEventType.unknown,
          eventTarget: WebsocketEventTarget.fromVoid(),
        );
}
