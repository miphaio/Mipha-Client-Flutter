enum WebsocketEventType implements Comparable<WebsocketEventType> {
  chatTouch(eventName: "CHAT_TOUCH"),
  chatRecord(eventName: "CHAT_RECORD"),
  chatRecordBuffer(eventName: "CHAT_RECORD_BUFFER"),
  chatRecordFlush(eventName: "CHAT_RECORD_FLUSH"),
  chatSummarize(eventName: "CHAT_SUMMARIZE"),

  connect(eventName: "CONNECT"),
  echo(eventName: "ECHO"),
  error(eventName: "ERROR"),
  unknown(eventName: "UNKNOWN");

  static fromString(String eventName) {
    return WebsocketEventType.values.firstWhere(
      (element) => element.eventName == eventName,
      orElse: () => WebsocketEventType.unknown,
    );
  }

  const WebsocketEventType({
    required this.eventName,
  });

  final String eventName;

  @override
  int compareTo(WebsocketEventType other) => eventName.compareTo(
        other.eventName,
      );
}
