import 'package:test_giphy_app/domain/models/error/server_error.dart';

class ConnectionServerError extends ServerError {
  const ConnectionServerError({
    super.message = '',
    super.code,
  });
}
