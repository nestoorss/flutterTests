import 'package:dio/dio.dart';

class PlacesInterceptor extends Interceptor {

  final accessToken = "pk.eyJ1IjoibmVzdG9yc3MwNSIsImEiOiJjbTk2b3N2dmcxODEwMnJyMGY0MDlkcTJxIn0.EkynYjb4lQHLW0C_UaHYMA";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'access_token': accessToken,
      'country': 'es',
      'language': 'es',
    });

    super.onRequest(options, handler);
  }
}