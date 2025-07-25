import "package:dio/dio.dart";
import "package:elevate_online_exams/generated/l10n.dart";

String handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return AppLocalizations().connectionTimeout;

    case DioExceptionType.sendTimeout:
      return AppLocalizations().sendTimeout;

    case DioExceptionType.receiveTimeout:
      return AppLocalizations().receiveTimeout;

    case DioExceptionType.badCertificate:
      return AppLocalizations().badCertificate;

    case DioExceptionType.badResponse:
      return _extractErrorMessageFromResponse(error.response);

    case DioExceptionType.cancel:
      return AppLocalizations().dioErrorCancel;

    case DioExceptionType.connectionError:
      return AppLocalizations().connectionError;

    case DioExceptionType.unknown:
      return "${AppLocalizations().unknownError} ${error.message ?? AppLocalizations().unknown}";
  }
}

String _extractErrorMessageFromResponse(Response? response) {
  if (response == null) return AppLocalizations().noResponse;
  

  try {
    final data = response.data;
    if (data is Map) {
      // Handles common formats
      if (data.containsKey('message')) return data['message'];
      if (data.containsKey('error')) return data['error'];
      if (data.containsKey('errors')) {
        // Laravel-style validation errors
        final errors = data['errors'];
        if (errors is Map && errors.isNotEmpty) {
          final firstError = errors.values.first;
          if (firstError is List && firstError.isNotEmpty) {
            return firstError.first.toString();
          }
        }
      }
    }

    if (data is String && data.isNotEmpty) {
      return data; // Plain text error response
    }

    return "${AppLocalizations().badResponse} [${response.statusCode}].";
  } catch (e) {
    return AppLocalizations().failedToParseResponse;
  }
}


