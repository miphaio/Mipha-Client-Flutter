import 'package:flutter/material.dart';
import 'package:mipha/proxy/chat/record/get/response.dart';

class ChatRecordLiveElement extends StatelessWidget {
  final PromptElement element;

  const ChatRecordLiveElement({
    required this.element,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final bool isUser = element.role == "user";

    return Container(
      padding: const EdgeInsets.only(
        left: 14,
        right: 14,
        top: 10,
        bottom: 10,
      ),
      child: Align(
        alignment: (isUser ? Alignment.topLeft : Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              16,
            ),
            color: isUser
                ? theme.colorScheme.secondaryContainer.withOpacity(0.5)
                : theme.colorScheme.primaryContainer,
          ),
          padding: const EdgeInsets.all(16),
          child: Text(
            element.content,
            style: TextStyle(
              fontSize: 15,
              color: isUser
                  ? theme.colorScheme.shadow
                  : theme.colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
