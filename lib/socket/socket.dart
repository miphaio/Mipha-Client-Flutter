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
      Uri.parse('wss://ws.postman-echo.com/raw'),
    );

    channel.sink.add('Hello!');

    channel.stream.listen((event) {
      logger.info(event.toString());
    });

    return MiphaSocket(
      channel: channel,
    );
  }
}
