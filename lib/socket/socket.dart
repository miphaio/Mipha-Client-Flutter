import 'package:bark/bark.dart';
import 'package:mipha/util/log.dart';
import 'package:mipha/util/uri.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MiphaSocket {
  WebSocketChannel? channel;

  MiphaSocket({
    this.channel,
  });

  factory MiphaSocket.createChannel(
    BarkAuthenticationToken token,
  ) {
    final WebSocketChannel channel = IOWebSocketChannel.connect(
      getMiphaSocketUri(),
      headers: {
        'Authorization': 'bearer ${token.getRawToken()}',
      },
    );

    channel.stream.listen((event) {
      logger.info(event.toString());
    });

    return MiphaSocket(
      channel: channel,
    );
  }
}
