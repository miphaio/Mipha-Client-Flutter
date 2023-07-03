import 'package:bark/bark.dart';
import 'package:dio/dio.dart';
import 'package:mipha/util/authentication.dart';
import 'package:mipha/util/log.dart';

final BaseOptions dioBaseOptions = BaseOptions(
  connectTimeout: const Duration(
    seconds: 5,
  ),
);

Dio getDio({
  bool? noAuthorization = false,
}) {
  return Dio(dioBaseOptions)
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          if (noAuthorization == null || !noAuthorization) {
            final BarkAuthenticationToken? token =
                await barkAuthentication.getAuthenticationToken();

            if (token == null) {
              return handler.next(options);
            }
            options.headers['Authorization'] = 'Bearer ${token.rawToken}';
            return handler.next(options);
          }
          return handler.next(options);
        },
      ),
    )
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (
          RequestOptions options,
          RequestInterceptorHandler handler,
        ) {
          logger.verbose(
            [
              '',
              '-----',
              'Request: ${options.method} ${options.uri}',
              'Headers: ${options.headers}',
              'Data: ${options.data}',
              '-----',
            ].join('\n'),
          );

          return handler.next(options);
        },
        onResponse: (
          Response response,
          ResponseInterceptorHandler handler,
        ) {
          logger.verbose(
            [
              '',
              '-----',
              'Response: ${response.realUri} ${response.statusCode}',
              'Headers: ${response.headers.map}',
              'Data: ${response.data}',
              '-----',
            ].join('\n'),
          );
          handler.next(response);
        },
        onError: (
          DioException dioError,
          ErrorInterceptorHandler handler,
        ) {
          logger.error([
            '',
            '-----',
            'Error: ${dioError.response?.realUri} ${dioError.response?.statusCode}',
            'Headers: ${dioError.response?.headers.map}',
            'Data: ${dioError.response?.data}',
            'Message: ${dioError.message}',
            '-----',
          ].join('\n'));
          handler.next(dioError);
        },
      ),
    );
}
