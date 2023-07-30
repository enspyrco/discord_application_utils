import 'package:http/http.dart';

/// When responding to an interaction fails we just want to throw something
/// with all the relevant data so it can be logged by the caller.
class ResponseException implements Exception {
  ResponseException(this._response);

  final Response _response;

  @override
  String toString() {
    return 'code: ${_response.statusCode} \n response: $_response';
  }
}
