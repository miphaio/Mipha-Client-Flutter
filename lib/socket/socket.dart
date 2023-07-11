import 'package:mipha/util/log.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MiphaSocket {
  WebSocketChannel? channel;

  MiphaSocket({
    this.channel,
  });

  factory MiphaSocket.createChannel() {
    final WebSocketChannel channel = IOWebSocketChannel.connect(
      Uri.parse('ws://localhost:5000'),
      headers: {
        "Authorization": "Bearer 1234567890",
      },
    );

    channel.stream.listen((event) {
      logger.info(event);
    });

    return MiphaSocket(
      channel: channel,
    );
  }
}
