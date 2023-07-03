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
      child: ListTile(
        title: Text(record.identifier),
        onTap: () {},
      ),
    );
  }
}
