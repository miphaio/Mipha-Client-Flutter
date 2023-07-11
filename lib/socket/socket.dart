import 'package:mipha/util/log.dart';
import 'package:mipha/util/uri.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MiphaSocket {
  WebSocketChannel? channel;

  MiphaSocket({
    this.channel,
  });

  factory MiphaSocket.createChannel() {
    final WebSocketChannel channel = IOWebSocketChannel.connect(
      getMiphaSocketUri(),
    );

    channel.sink.add('Hello!');

    channel.stream.listen((event) {
      logger.info(event.toString());
      channel.sink.close();
    });

    return MiphaSocket(
      channel: channel,
    );
  }
}
