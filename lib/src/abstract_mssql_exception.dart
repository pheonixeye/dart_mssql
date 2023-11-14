// ignore_for_file: non_constant_identifier_names

import 'package:dartedious_spi/r2dbc_exception.dart';

/// Microsoft SQL Server-specific exception class.
///
/// @author Mark Paluch
class AbstractMssqlException extends R2dbcException {
  static final int DRIVER_ERROR_NONE = 0;
  static final int DRIVER_ERROR_FROM_DATABASE = 2;
  static final int DRIVER_ERROR_IO_FAILED = 3;
  static final int DRIVER_ERROR_INVALID_TDS = 4;
  static final int DRIVER_ERROR_SSL_FAILED = 5;
  static final int DRIVER_ERROR_UNSUPPORTED_CONFIG = 6;
  static final int DRIVER_ERROR_INTERMITTENT_TLS_FAILED = 7;
  static final int ERROR_SOCKET_TIMEOUT = 8;
  static final int ERROR_QUERY_TIMEOUT = 9;

  String? reason;
  String? _sqlState;
  int? _errorCode;
  Exception? cause;

  /// Creates a new exception.
  AbstractMssqlException({
    this.reason,
    String? sqlState,
    required int errorCode,
    this.cause,
  })  : _errorCode = errorCode,
        _sqlState = sqlState,
        super(errorCode: errorCode);
}
