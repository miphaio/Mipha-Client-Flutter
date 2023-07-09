class ChatRecordGetResponse {
  final String chatRecordIdentifier;
  final ChatRecordDataStructure record;

  ChatRecordGetResponse({
    required this.chatRecordIdentifier,
    required this.record,
  });

  factory ChatRecordGetResponse.fromJson(final Map<String, dynamic> json) {
    return ChatRecordGetResponse(
      chatRecordIdentifier: json['chatRecordIdentifier'],
      record: ChatRecordDataStructure.fromJson(json['record']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chatRecordIdentifier': chatRecordIdentifier,
      'record': record.toJson(),
    };
  }

  @override
  String toString() {
    return 'ChatRecordGetResponse{${toJson()}}';
  }
}

class ChatRecordDataStructure {
  final List<PromptElement> promptElements;

  ChatRecordDataStructure({
    required this.promptElements,
  });

  factory ChatRecordDataStructure.fromJson(final Map<String, dynamic> json) {
    return ChatRecordDataStructure(
      promptElements: (json['promptElements'] as List<dynamic>)
          .map((e) => PromptElement.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'promptElements': promptElements.map((e) => e.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'ChatRecordDataStructure{${toJson()}}';
  }
}

class PromptElement {
  final String role;
  final String content;

  PromptElement({
    required this.role,
    required this.content,
  });

  factory PromptElement.fromJson(final Map<String, dynamic> json) {
    return PromptElement(
      role: json['role'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'content': content,
    };
  }

  @override
  String toString() {
    return 'PromptElement{${toJson()}}';
  }
}
