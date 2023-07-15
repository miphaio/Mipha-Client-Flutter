import 'package:flutter/foundation.dart';

Uri getMiphaHTTPApiUri() {
  if (kDebugMode) {
    return Uri.http("localhost:4000");
  }
  return Uri.https("prod.rest.api.core.mipha.io");
}

Uri getMiphaSocketUri() {
  return Uri.parse("wss://prod.websocket.api.core.mipha.io/prod");
}
