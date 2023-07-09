import 'package:flutter/material.dart';
import 'package:mipha/proxy/chat/record/get/response.dart';

class ChatRecordLive extends StatefulWidget {
  final ChatRecordGetResponse response;

  const ChatRecordLive({
    required this.response,
    super.key,
  });

  @override
  State<ChatRecordLive> createState() => _ChatRecordLiveState();
}

class _ChatRecordLiveState extends State<ChatRecordLive> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
