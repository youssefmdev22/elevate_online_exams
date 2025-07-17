import "package:dio/dio.dart";

String handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return "Connection timeout. Please try again later.";

    case DioExceptionType.sendTimeout:
      return "Request timed out. Please try again.";

    case DioExceptionType.receiveTimeout:
      return "Server took too long to respond.";

    case DioExceptionType.badCertificate:
      return "Bad certificate. Please check your device date/time.";

    case DioExceptionType.badResponse:
      return _extractErrorMessageFromResponse(error.response);

    case DioExceptionType.cancel:
      return "Request was cancelled. Please retry.";

    case DioExceptionType.connectionError:
      return "Network error. Please check your internet connection.";

    case DioExceptionType.unknown:
      return "An unexpected error occurred: ${error.message ?? "Unknown"}";
  }
}

String _extractErrorMessageFromResponse(Response? response) {
  if (response == null) return "No response received from server.";
  

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

    return "Unexpected error response from server [${response.statusCode}].";
  } catch (e) {
    return "Failed to parse error response.";
  }
}


