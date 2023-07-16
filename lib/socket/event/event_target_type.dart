enum WebsocketEventTargetType implements Comparable<WebsocketEventTargetType> {
  connection(eventTargetName: "CONNECTION"),
  chatRecord(eventTargetName: "CHAT_RECORD"),
  voidType(eventTargetName: "VOID");

  static fromString(String eventName) {
    return WebsocketEventTargetType.values.firstWhere(
      (element) => element.eventTargetName == eventName,
      orElse: () => WebsocketEventTargetType.voidType,
    );
  }

  const WebsocketEventTargetType({
    required this.eventTargetName,
  });

  final String eventTargetName;

  @override
  int compareTo(WebsocketEventTargetType other) {
    return eventTargetName.compareTo(
      other.eventTargetName,
    );
  }
}
