import 'package:mipha/socket/event/event.dart';
import 'package:mipha/socket/event/event_target.dart';
import 'package:mipha/socket/event/event_type.dart';

class WebsocketConnectEvent extends WebsocketEvent {
  WebsocketConnectEvent({
    required WebsocketEventTarget target,
  }) : super(
          eventType: WebsocketEventType.connect,
          eventTarget: target,
        );
}
