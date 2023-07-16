import 'package:mipha/socket/event/event_target.dart';
import 'package:mipha/socket/event/event_type.dart';

class WebsocketEvent {
  final WebsocketEventType eventType;
  final WebsocketEventTarget eventTarget;

  WebsocketEvent({
    required this.eventType,
    required this.eventTarget,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': eventType.toString(),
      'target': eventTarget.toJson(),
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
