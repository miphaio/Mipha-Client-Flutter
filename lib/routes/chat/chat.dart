import 'package:flutter/material.dart';

import '../../i18n/chat/localizations.dart';

class ChatView extends StatelessWidget {
  const ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ChatLocalizations chatLocalizations = ChatLocalizations.of(context);

    return Scaffold(
      body: Center(
        child: chatLocalizations.getText("chat"),
      ),
    );
  }
}
