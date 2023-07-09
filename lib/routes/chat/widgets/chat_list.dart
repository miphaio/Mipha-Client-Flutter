import 'package:flutter/material.dart';
import 'package:mipha/proxy/chat/record/outline/get/response.dart';
import 'package:mipha/routes/chat/widgets/chat_item.dart';

class ChatViewList extends StatelessWidget {
  final ChatRecordOutlineGetResponse response;

  const ChatViewList({
    required this.response,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: response.records.map(
          (ChatRecordOutlineGetResponseRecord record) {
            return ChatViewItem(
              record: record,
            );
          },
        ).toList(),
      ),
    );
  }
}
