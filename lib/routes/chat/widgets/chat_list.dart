import 'package:flutter/material.dart';
import 'package:mipha/proxy/chat/record/outline/get/response.dart';
import 'package:mipha/routes/chat/widgets/chat_item.dart';
import 'package:mipha/socket/socket.dart';

class ChatViewList extends StatelessWidget {
  final ChatRecordOutlineGetResponse response;
  final MiphaSocket miphaSocket;

  const ChatViewList({
    required this.response,
    required this.miphaSocket,
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
              miphaSocket: miphaSocket,
            );
          },
        ).toList(),
      ),
    );
  }
}
