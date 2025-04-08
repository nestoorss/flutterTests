import 'package:dio/dio.dart';

class TrafficInterceptor extends Interceptor {

  final accessToken = "pk.eyJ1IjoibmVzdG9yc3MwNSIsImEiOiJjbTk2b3N2dmcxODEwMnJyMGY0MDlkcTJxIn0.EkynYjb4lQHLW0C_UaHYMA";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'alternatives': true,
      'geometries': 'polyline6',
      'overview': 'simplified',
      'steps': false,
      'access_token': accessToken
    });
    super.onRequest(options, handler);
  }
}