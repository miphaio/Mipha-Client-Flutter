class HealthGetResponse {
  final String version;
  final String region;

  HealthGetResponse({
    required this.version,
    required this.region,
  });

  factory HealthGetResponse.fromJson(final Map<String, dynamic> json) {
    return HealthGetResponse(
      version: json['version'],
      region: json['region'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'version': version,
      'region': region,
    };
  }

  @override
  String toString() {
    return 'HealthGetResponse{$toJson()}';
  }
}
