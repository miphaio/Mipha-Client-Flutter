import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mipha/i18n/chat/localizations.dart';
import 'package:mipha/proxy/chat/record/get/call.dart';
import 'package:mipha/proxy/chat/record/get/response.dart';
import 'package:mipha/routes/record/widgets/chat_record.dart';
import 'package:mipha/util/log.dart';
import 'package:mipha/util/uri.dart';

class RecordView extends StatefulWidget {
  final String chatRecordIdentifier;

  const RecordView({
    required this.chatRecordIdentifier,
    super.key,
  });

  @override
  State<RecordView> createState() => _RecordViewState();
}

class _RecordViewState extends State<RecordView> {
  bool _loading = true;
  ChatRecordGetResponse? _chatRecordGetResponse;

  @override
  void initState() {
    super.initState();
    _fetchRecord();
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
    if (_loading) {
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
      response: _chatRecordGetResponse!,
    );
  }

  Future<void> _fetchRecord() async {
    final Uri uri = getMiphaHTTPApiUri();

    try {
      final ChatRecordGetResponse response =
          await callChatRecordGet(uri, widget.chatRecordIdentifier);

      setState(() {
        _chatRecordGetResponse = response;
        _loading = false;
      });
    } catch (e) {
      logger.error(e);
    }
  }
}
