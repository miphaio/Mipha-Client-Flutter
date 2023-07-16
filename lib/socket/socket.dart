import 'dart:convert';

import 'package:bark/bark.dart';
import 'package:mipha/socket/event/event.dart';
import 'package:mipha/socket/event/event_type.dart';
import 'package:mipha/socket/event/parse.dart';
import 'package:mipha/util/log.dart';
import 'package:mipha/util/uri.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MiphaSocket {
  final WebSocketChannel channel;
  final Map<WebsocketEventType, Set<Function>> _eventListeners = {};

  MiphaSocket({
    required this.channel,
  }) {
    channel.stream.listen(_onMessage);
  }

  factory MiphaSocket.createChannel(
    BarkAuthenticationToken token,
  ) {
    final WebSocketChannel channel = IOWebSocketChannel.connect(
      getMiphaSocketUri(),
      headers: {
        'Authorization': 'bearer ${token.getRawToken()}',
      },
    );

    return MiphaSocket(
      channel: channel,
    );
  }

  void addEventListener(
    WebsocketEventType eventType,
    Function callback,
  ) {
    if (!_eventListeners.containsKey(eventType)) {
      _eventListeners[eventType] = {};
    }

    _eventListeners[eventType]!.add(callback);
  }

  void removeEventListener(
    WebsocketEventType eventType,
    Function callback,
  ) {
    if (!_eventListeners.containsKey(eventType)) {
      return;
    }

    _eventListeners[eventType]!.remove(callback);
  }

  void _onMessage(dynamic event) {
    final dynamic json = jsonDecode(event.toString());
    final WebsocketEvent websocketEvent = parseWebsocketEvent(json);

    logger.info("Message Received: $websocketEvent");

    if (!_eventListeners.containsKey(websocketEvent.eventType)) {
      return;
    }

    for (var callback in _eventListeners[websocketEvent.eventType]!) {
      callback(websocketEvent);
    }
  }
}
