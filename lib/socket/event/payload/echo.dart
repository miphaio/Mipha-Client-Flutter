import 'package:mipha/socket/event/event.dart';
import 'package:mipha/socket/event/event_target.dart';
import 'package:mipha/socket/event/event_type.dart';

class WebsocketEchoEvent extends WebsocketEvent {
  final dynamic content;

  WebsocketEchoEvent({
    required this.content,
  }) : super(
          eventType: WebsocketEventType.echo,
          eventTarget: WebsocketEventTarget.fromVoid(),
        );
}
