import 'package:flutter/material.dart';
import 'package:localizations_date/localizations_date.dart';
import 'package:mipha/i18n/chat/localizations.dart';
import 'package:mipha/proxy/chat/record/outline/get/response.dart';
import 'package:mipha/routes/record/record.dart';
import 'package:mipha/socket/socket.dart';

class ChatViewItem extends StatelessWidget {
  final ChatRecordOutlineGetResponseRecord record;
  final MiphaSocket miphaSocket;

  const ChatViewItem({
    required this.record,
    required this.miphaSocket,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ChatLocalizations chatLocalizations = ChatLocalizations.of(context);
    final GlobalDateLocalizations dateLocalizations =
        GlobalDateLocalizations.of(context);

    return Card(
      child: ListTile(
        title: Text(
          record.summary ?? chatLocalizations.getString("noSummary"),
        ),
        subtitle: Text(
          dateLocalizations.relativeFormatDate(
            record.updatedAt,
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return RecordView(
                  chatRecordIdentifier: record.identifier,
                  miphaSocket: miphaSocket,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
