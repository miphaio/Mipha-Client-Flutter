import 'package:bark/bark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mipha/i18n/chat/localizations.dart';
import 'package:mipha/socket/event/event.dart';
import 'package:mipha/socket/event/event_type.dart';
import 'package:mipha/socket/socket.dart';
import 'package:mipha/util/authentication.dart';
import 'package:mipha/util/log.dart';

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
  MiphaSocket? _miphaSocket;

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _establishConnection();
  }

  @override
  void dispose() {
    super.dispose();
    _miphaSocket?.channel.sink.close();
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

  Future<void> _establishConnection() async {
    final BarkAuthenticationToken? token =
        await barkAuthentication.ensureAuthenticationToken();

    if (token == null) {
      logger.warning("No token");
      return;
    }

    _miphaSocket = MiphaSocket.createChannel(token);

    _miphaSocket!.addEventListener(WebsocketEventType.connect, () {
      logger.info("Connected");
    });

    _miphaSocket!.addEventListener(
      WebsocketEventType.chatRecord,
      (WebsocketEvent event) {
        logger.info(event);
      },
    );

    await _miphaSocket!.channel.ready;

    _miphaSocket!.channel.sink.add({
      "action": "chat-record",
      "payload": {
        "chatRecordIdentifier": "cd483131-e4d9-403c-838c-679e49685f8b",
      }
    });

    logger.info("Connection Ready");

    setState(() {
      _loading = false;
    });
  }
}
