import 'package:flutter/material.dart';
import 'package:mipha/socket/socket.dart';
import 'package:mipha/util/log.dart';

class DebugCenterConnectWebsocket extends StatelessWidget {
  const DebugCenterConnectWebsocket({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text("Connect Websocket"),
        onTap: () {
          final MiphaSocket miphaSocket = MiphaSocket.createChannel();

          logger.info(miphaSocket);
        },
      ),
    );
  }
}
