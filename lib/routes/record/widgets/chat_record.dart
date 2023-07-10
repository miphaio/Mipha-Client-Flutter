import 'package:flutter/material.dart';
import 'package:mipha/proxy/chat/record/get/response.dart';
import 'package:mipha/routes/record/widgets/element.dart';

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
    return ListView.builder(
      itemCount: widget.response.record.promptElements.length,
      shrinkWrap: true,
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ChatRecordLiveElement(
          element: widget.response.record.promptElements[index],
        );
      },
    );
  }
}
