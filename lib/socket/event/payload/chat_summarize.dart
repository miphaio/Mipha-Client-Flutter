import 'package:mipha/socket/event/event.dart';
import 'package:mipha/socket/event/event_target.dart';
import 'package:mipha/socket/event/event_type.dart';

class WebsocketChatSummarizeEvent extends WebsocketEvent {
  final String version;
  final String summary;

  WebsocketChatSummarizeEvent({
    required WebsocketEventTarget target,
    required this.version,
    required this.summary,
  }) : super(
          eventType: WebsocketEventType.chatSummarize,
          eventTarget: target,
        );
}
