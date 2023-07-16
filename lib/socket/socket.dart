import 'dart:convert';

import 'package:bark/bark.dart';
import 'package:mipha/socket/event/event.dart';
import 'package:mipha/socket/event/parse.dart';
import 'package:mipha/util/uri.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MiphaSocket {
  WebSocketChannel channel;

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

  void _onMessage(dynamic event) {
    final dynamic json = jsonDecode(event.toString());
    final WebsocketEvent websocketEvent = parseWebsocketEvent(json);
  }
}
