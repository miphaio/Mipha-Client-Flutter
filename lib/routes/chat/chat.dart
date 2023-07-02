import 'package:flutter/material.dart';
import 'package:mipha/i18n/chat/localizations.dart';
import 'package:mipha/proxy/chat/record/get/call.dart';
import 'package:mipha/proxy/chat/record/get/response.dart';
import 'package:mipha/util/log.dart';
import 'package:mipha/util/uri.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  void initState() {
    super.initState();
    _fetchRecords();
  }

  @override
  Widget build(BuildContext context) {
    final ChatLocalizations chatLocalizations = ChatLocalizations.of(context);

    return Scaffold(
      body: Center(
        child: chatLocalizations.getText("chat"),
      ),
    );
  }

  Future<void> _fetchRecords() async {
    final Uri uri = getMiphaHTTPApiUri();

    try {
      final ChatRecordGetResponse response = await callChatRecordGet(uri);
      logger.debug(response);
    } catch (e) {
      logger.error(e);
    }
  }
}
