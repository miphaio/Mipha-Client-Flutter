class ChatRecordGetResponse {
  final List<ChatRecordGetResponseRecord> records;
  final int totalRecord;
  final int totalPage;
  final int currentPage;

  ChatRecordGetResponse({
    required this.records,
    required this.totalRecord,
    required this.totalPage,
    required this.currentPage,
  });

  factory ChatRecordGetResponse.fromJson(final Map<String, dynamic> json) {
    return ChatRecordGetResponse(
      records: (json['records'] as List<dynamic>)
          .map((e) => ChatRecordGetResponseRecord.fromJson(e))
          .toList(),
      totalRecord: json['totalRecord'],
      totalPage: json['totalPage'],
      currentPage: json['currentPage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'records': records.map((e) => e.toJson()).toList(),
      'totalRecord': totalRecord,
      'totalPage': totalPage,
      'currentPage': currentPage,
    };
  }

  @override
  String toString() {
    return 'ChatRecordGetResponse{${toJson()}}';
  }
}

class ChatRecordGetResponseRecord {
  final String identifier;
  final DateTime updatedAt;
  final int version;

  ChatRecordGetResponseRecord({
    required this.identifier,
    required this.updatedAt,
    required this.version,
  });

  factory ChatRecordGetResponseRecord.fromJson(
      final Map<String, dynamic> json) {
    return ChatRecordGetResponseRecord(
      identifier: json['identifier'],
      updatedAt: DateTime.fromMillisecondsSinceEpoch(
        json['updatedAt'],
      ),
      version: json['version'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'identifier': identifier,
      'updatedAt': updatedAt.toIso8601String(),
      'version': version,
    };
  }

  @override
  String toString() {
    return 'ChatRecordGetResponseRecord{$toJson()}';
  }
}
