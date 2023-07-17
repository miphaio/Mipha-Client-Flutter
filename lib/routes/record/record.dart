import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mipha/i18n/chat/localizations.dart';
import 'package:mipha/proxy/chat/record/get/response.dart';
import 'package:mipha/routes/record/widgets/chat_record.dart';
import 'package:mipha/socket/event/event_type.dart';
import 'package:mipha/socket/event/payload/chat_record.dart';
import 'package:mipha/socket/socket.dart';
import 'package:mipha/util/log.dart';

class RecordView extends StatefulWidget {
  final String chatRecordIdentifier;
  final MiphaSocket miphaSocket;

  const RecordView({
    required this.chatRecordIdentifier,
    required this.miphaSocket,
    super.key,
  });

  @override
  State<RecordView> createState() => _RecordViewState();
}

class _RecordViewState extends State<RecordView> {
  ChatRecordDataStructure? _chatRecord;

  @override
  void initState() {
    super.initState();

    widget.miphaSocket.addEventListener(
      WebsocketEventType.chatRecord,
      _chatRecordListener,
    );

    _requestForChatRecord();
  }

  @override
  void dispose() {
    super.dispose();

    widget.miphaSocket.removeEventListener(
      WebsocketEventType.chatRecord,
      _chatRecordListener,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ChatLocalizations chatLocalizations = ChatLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: chatLocalizations.getText("record"),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_chatRecord == null) {
      return Center(
        child: SpinKitPulsingGrid(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven
                    ? Theme.of(context).colorScheme.background
                    : Theme.of(context).primaryColor,
              ),
            );
          },
        ),
      );
    }

    return ChatRecordLive(
      record: _chatRecord!,
    );
  }

  void _chatRecordListener(WebsocketChatRecordEvent event) {
    logger.info(event);
    logger.info(event.chatRecord);

    setState(() {
      _chatRecord = event.chatRecord;
    });
  }

  void _requestForChatRecord() {
    widget.miphaSocket.channel.sink.add(
      jsonEncode(
        {
          "action": "chat-record",
          "payload": {
            "chatRecordIdentifier": widget.chatRecordIdentifier,
          },
        },
      ),
    );
  }
}
