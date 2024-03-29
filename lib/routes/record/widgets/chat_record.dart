import 'package:flutter/material.dart';
import 'package:mipha/proxy/chat/record/get/response.dart';
import 'package:mipha/routes/record/widgets/chat_box.dart';
import 'package:mipha/routes/record/widgets/element.dart';
import 'package:mipha/util/log.dart';

class ChatRecordLive extends StatefulWidget {
  final ChatRecordDataStructure record;

  const ChatRecordLive({
    required this.record,
    super.key,
  });

  @override
  State<ChatRecordLive> createState() => _ChatRecordLiveState();
}

class _ChatRecordLiveState extends State<ChatRecordLive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.record.promptElements.length,
        shrinkWrap: true,
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
        ),
        itemBuilder: (context, index) {
          return ChatRecordLiveElement(
            element: widget.record.promptElements[index],
          );
        },
      ),
      bottomNavigationBar: ChatRecordChatBox(
        onMessageSend: (String message) {
          logger.info(message);
        },
      ),
    );
  }
}
