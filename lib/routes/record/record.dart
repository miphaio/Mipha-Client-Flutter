import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mipha/i18n/chat/localizations.dart';
import 'package:mipha/proxy/chat/record/get/call.dart';
import 'package:mipha/proxy/chat/record/get/response.dart';
import 'package:mipha/routes/record/widgets/chat_record.dart';
import 'package:mipha/socket/socket.dart';
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
  final MiphaSocket _miphaSocket = MiphaSocket.createChannel();

  bool _loading = true;

  @override
  void initState() {
    super.initState();
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

    return Container();
  }
}
