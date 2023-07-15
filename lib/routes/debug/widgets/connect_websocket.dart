import 'package:bark/bark.dart';
import 'package:flutter/material.dart';
import 'package:mipha/socket/socket.dart';
import 'package:mipha/util/authentication.dart';
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
        onTap: () async {
          final BarkAuthenticationToken? token =
              await barkAuthentication.ensureAuthenticationToken();

          if (token == null) {
            logger.warning("No token");
            return;
          }

          final MiphaSocket miphaSocket = MiphaSocket.createChannel(token);

          logger.info(miphaSocket);
        },
      ),
    );
  }
}
