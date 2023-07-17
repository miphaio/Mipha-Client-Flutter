import 'package:bark/bark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mipha/proxy/chat/record/outline/get/call.dart';
import 'package:mipha/proxy/chat/record/outline/get/response.dart';
import 'package:mipha/routes/chat/widgets/chat_list.dart';
import 'package:mipha/socket/socket.dart';
import 'package:mipha/util/authentication.dart';
import 'package:mipha/util/log.dart';
import 'package:mipha/util/uri.dart';

class ChatView extends StatefulWidget {
  const ChatView({
    super.key,
  });

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  bool _chatRecordLoading = true;
  ChatRecordOutlineGetResponse? _chatRecordGetResponse;

  bool _socketLoading = true;
  MiphaSocket? _miphaSocket;

  @override
  void initState() {
    super.initState();
    _fetchRecords();
    _establishConnection();
  }

  @override
  void dispose() {
    super.dispose();
    _miphaSocket?.channel.sink.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_chatRecordLoading && _socketLoading) {
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

    return ChatViewList(
      response: _chatRecordGetResponse!,
      miphaSocket: _miphaSocket!,
    );
  }

  Future<void> _fetchRecords() async {
    final Uri uri = getMiphaHTTPApiUri();

    try {
      final ChatRecordOutlineGetResponse response =
          await callChatRecordOutlineGet(uri);

      setState(() {
        _chatRecordLoading = false;
        _chatRecordGetResponse = response;
      });
    } catch (e) {
      logger.error(e);
    }
  }

  Future<void> _establishConnection() async {
    final BarkAuthenticationToken? token =
        await barkAuthentication.ensureAuthenticationToken();

    if (token == null) {
      logger.warning("No token");
      return;
    }

    _miphaSocket = MiphaSocket.createChannel(token);

    await _miphaSocket!.channel.ready;

    logger.info("Connection Ready");

    setState(() {
      _socketLoading = false;
    });
  }
}
