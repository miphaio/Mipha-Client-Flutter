import 'package:mipha/util/log.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MiphaSocket {
  MiphaSocket();

  WebSocketChannel? _channel;

  void connect() {
    _channel = WebSocketChannel.connect(
      Uri.parse('ws://localhost:5000'),
    );

    logger.debug(_channel);
  }
}
