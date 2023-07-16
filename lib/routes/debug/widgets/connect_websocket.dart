import 'dart:convert';

import 'package:bark/bark.dart';
import 'package:flutter/material.dart';
import 'package:mipha/socket/socket.dart';
import 'package:mipha/util/authentication.dart';
import 'package:mipha/util/log.dart';

// ignore: must_be_immutable
class DebugCenterConnectWebsocket extends StatelessWidget {
  MiphaSocket? _miphaSocket;

  DebugCenterConnectWebsocket({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: const Text("Connect Websocket"),
            onTap: () async {
              final BarkAuthenticationToken? token =
                  await barkAuthentication.ensureAuthenticationToken();

              if (token == null) {
                logger.warning("No token");
                return;
              }

              _miphaSocket = MiphaSocket.createChannel(token);

              logger.info(_miphaSocket);
            },
          ),
          ListTile(
            title: const Text("Send Websocket Message"),
            onTap: () async {
              if (_miphaSocket == null) {
                logger.warning("No socket");
                return;
              }

              _miphaSocket!.channel.sink.add(
                jsonEncode(
                  {
                    "hello": "world",
                  },
                ),
              );

              logger.info("Message Sent");
            },
          ),
          ListTile(
            title: const Text("Close Message"),
            onTap: () async {
              if (_miphaSocket == null) {
                logger.warning("No socket");
                return;
              }

              _miphaSocket!.channel.sink.close();
              _miphaSocket = null;

              logger.info("Socket Closed");
            },
          ),
        ],
      ),
    );
  }
}
