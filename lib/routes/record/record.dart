import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.chatRecordIdentifier),
      ),
    );
  }
}
