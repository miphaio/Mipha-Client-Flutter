import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mipha/proxy/chat/record/get/call.dart';
import 'package:mipha/proxy/chat/record/get/response.dart';
import 'package:mipha/routes/chat/widgets/chat_list.dart';
import 'package:mipha/util/log.dart';
import 'package:mipha/util/uri.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  bool _loading = true;
  ChatRecordGetResponse? _chatRecordGetResponse;

  @override
  void initState() {
    super.initState();
    _fetchRecords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

    return ChatViewList(
      response: _chatRecordGetResponse!,
    );
  }

  Future<void> _fetchRecords() async {
    final Uri uri = getMiphaHTTPApiUri();

    try {
      final ChatRecordGetResponse response = await callChatRecordGet(uri);

      setState(() {
        _loading = false;
        _chatRecordGetResponse = response;
      });
    } catch (e) {
      logger.error(e);
    }
  }
}
