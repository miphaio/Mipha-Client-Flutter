import 'package:flutter/material.dart';
import 'package:mipha/i18n/chat/localizations.dart';
import 'package:mipha/proxy/chat/record/outline/get/response.dart';
import 'package:mipha/routes/record/record.dart';

class ChatViewItem extends StatelessWidget {
  final ChatRecordOutlineGetResponseRecord record;

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
        subtitle: chatLocalizations.getText("key"),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return RecordView(
                  chatRecordIdentifier: record.identifier,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
