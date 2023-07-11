import 'package:mipha/util/log.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MiphaSocket {
  static Future<MiphaSocket> connect() async {
    final WebSocketChannel channel = WebSocketChannel.connect(
      Uri.parse('ws://localhost:5000'),
      protocols: [
        'echo-protocol',
      ],
    );

    channel.stream.listen((event) {
      logger.info(event);
    });

    return MiphaSocket(
      channel: channel,
    );
  }

  WebSocketChannel channel;

  MiphaSocket({
    required this.channel,
  });
}
