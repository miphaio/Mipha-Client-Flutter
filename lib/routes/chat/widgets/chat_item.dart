import 'package:flutter/material.dart';
import 'package:mipha/i18n/chat/localizations.dart';
import 'package:mipha/proxy/chat/record/get/response.dart';

class ChatViewItem extends StatelessWidget {
  final ChatRecordGetResponseRecord record;

  const ChatViewItem({
    required this.record,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ChatLocalizations chatLocalizations = ChatLocalizations.of(context);

    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 12.0,
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 4.0,
              bottom: 4.0,
            ),
            child: chatLocalizations.getText(
              'from!1',
              replaces: [
                "",
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 4.0,
              bottom: 4.0,
            ),
            child: chatLocalizations.getText(
              'to!1',
              replaces: [
                "",
              ],
            ),
          ),
          Container(
            height: 12.0,
          ),
          const Divider(
            height: 8.0,
            thickness: 1.0,
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            ),
          ),
        ],
      ),
    );
  }
}
