import 'package:flutter/material.dart';
import 'package:mipha/i18n/chat/localizations.dart';

class ChatRecordChatBox extends StatefulWidget {
  const ChatRecordChatBox({
    super.key,
  });

  @override
  State<ChatRecordChatBox> createState() => _ChatRecordChatBoxState();
}

class _ChatRecordChatBoxState extends State<ChatRecordChatBox> {
  @override
  Widget build(BuildContext context) {
    final ChatLocalizations chatLocalizations = ChatLocalizations.of(context);
    final ThemeData theme = Theme.of(context);

    return SizedBox(
      height: 60,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(
                left: 10,
                bottom: 10,
                top: 10,
              ),
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: chatLocalizations.getString("ask-anything"),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: theme.primaryColor,
                    elevation: 0,
                    child: const Icon(
                      Icons.send,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
