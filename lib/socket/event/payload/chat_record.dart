import 'package:mipha/proxy/chat/record/get/response.dart';
import 'package:mipha/socket/event/event.dart';
import 'package:mipha/socket/event/event_target.dart';
import 'package:mipha/socket/event/event_type.dart';

class WebsocketChatRecordEvent extends WebsocketEvent {
  final ChatRecordDataStructure chatRecordDataStructure;

  WebsocketChatRecordEvent({
    required WebsocketEventTarget target,
    required this.chatRecordDataStructure,
  }) : super(
          eventType: WebsocketEventType.chatRecord,
          eventTarget: target,
        );
}
