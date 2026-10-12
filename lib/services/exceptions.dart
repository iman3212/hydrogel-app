import 'package:dio/dio.dart';

enum RequestType {
  POST,
  GET,
  LOGIN,
  PROFILE,
  History,
  Micro,
  Camera
}

class ApiException {
  List<String> getExceptionMessage(
      DioException exception, RequestType requestType) {
    switch (exception.type) {

      case DioExceptionType.badResponse:
        if (requestType == RequestType.LOGIN) {
          return [
            "Warning",
            "Your username or password is incorrect, please check and try again"
          ];
        } else {
          return [
            "Bad Responce Error",
            "Check Api url or parameters are invalid "
          ];
        }
      case DioExceptionType.connectionError:
        if (requestType == RequestType.POST ||
            requestType == RequestType.LOGIN) {
          return ["Connection Error", "Check network connectively and try again"];
        } else {
          return ["Connection Error", "Check network connectively and try again"];
        }

      case DioExceptionType.connectionTimeout:
        return ["Connection Timeout", "Check network connectively "];
      case DioExceptionType.sendTimeout:
        return ["Connection Timeout", "Check network connectively "];
      case DioExceptionType.badCertificate:
        return ["Bad Crtificate", "Check network connectively "];
      case DioExceptionType.cancel:
        return ["Request cancell", "Check Api url or parameters are invalid "];
      case DioExceptionType.receiveTimeout:
        return [
          "Recive Timeout",
          "Check Api url Network connectively or parameters are invalid "
        ];
      case DioExceptionType.connectionError:
        return ["Connection Error", "Please check your connection error "];
      default:
        return [
          "Unknown Error",
          "Check Api url Network connectively or parameters are invalid "
        ];
    }
  }
}
