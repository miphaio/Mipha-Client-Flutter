import 'package:flutter/material.dart';
import 'package:mipha/routes/debug/widgets/connect_websocket.dart';

class DebugCenterView extends StatelessWidget {
  const DebugCenterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DebugCenterConnectWebsocket(),
          ],
        ),
      ),
    );
  }
}
