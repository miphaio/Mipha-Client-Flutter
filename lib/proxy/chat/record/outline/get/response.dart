class ChatRecordOutlineGetResponse {
  final List<ChatRecordOutlineGetResponseRecord> records;
  final int totalRecord;
  final int totalPage;
  final int currentPage;

  ChatRecordOutlineGetResponse({
    required this.records,
    required this.totalRecord,
    required this.totalPage,
    required this.currentPage,
  });

  factory ChatRecordOutlineGetResponse.fromJson(
      final Map<String, dynamic> json) {
    return ChatRecordOutlineGetResponse(
      records: (json['records'] as List<dynamic>)
          .map(
            (e) => ChatRecordOutlineGetResponseRecord.fromJson(e),
          )
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
    return 'ChatRecordOutlineGetResponse{${toJson()}}';
  }
}

class ChatRecordOutlineGetResponseRecord {
  final String identifier;
  final String? summary;
  final DateTime updatedAt;
  final int version;

  ChatRecordOutlineGetResponseRecord({
    required this.identifier,
    this.summary,
    required this.updatedAt,
    required this.version,
  });

  factory ChatRecordOutlineGetResponseRecord.fromJson(
      final Map<String, dynamic> json) {
    return ChatRecordOutlineGetResponseRecord(
      identifier: json['identifier'],
      summary: json['summary'],
      updatedAt: DateTime.fromMillisecondsSinceEpoch(
        json['updatedAt'],
      ),
      version: json['version'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'identifier': identifier,
      'summary': summary,
      'updatedAt': updatedAt.toIso8601String(),
      'version': version,
    };
  }

  @override
  String toString() {
    return 'ChatRecordOutlineGetResponseRecord{$toJson()}';
  }
}
