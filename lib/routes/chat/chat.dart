import 'package:flutter/material.dart';

import '../../i18n/chat/localizations.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
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
