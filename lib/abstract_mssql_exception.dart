// ignore_for_file: non_constant_identifier_names

/// Microsoft SQL Server-specific exception class.
///
/// @author Mark Paluch
class AbstractMssqlException extends RuntimeException {
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
  String? sqlState;
  int? errorCode;
  Exception? cause;

  /// Creates a new exception.
  AbstractMssqlException({
    this.reason,
    this.sqlState,
    this.errorCode,
    this.cause,
  });

  /// Creates a new exception.
  ///
  /// @param reason the reason for the error.  Set as the exception's message and retrieved with {@link #getMessage()}.
  // factory AbstractMssqlException.reason(String? reason) {
  //   return AbstractMssqlException(reason, '', null);
  // }

  // /// Creates a new exception.
  // ///
  // /// @param reason   the reason for the error.  Set as the exception's message and retrieved with {@link #getMessage()}.
  // /// @param sqlState the "SQLstate" string, which follows either the XOPEN SQLstate conventions or the SQL:2003 conventions
  // factory AbstractMssqlException.reasonState(String? reason, String? sqlState) {
  //   return AbstractMssqlException(reason, sqlState, 0);
  // }

  // /// Creates a new exception.
  // ///
  // /// @param reason    the reason for the error.  Set as the exception's message and retrieved with {@link #getMessage()}.
  // /// @param sqlState  the "SQLstate" string, which follows either the XOPEN SQLstate conventions or the SQL:2003 conventions
  // /// @param errorCode a vendor-specific error code representing this failure
  // factory AbstractMssqlException.reasonStateCode(
  //     String? reason, String? sqlState, int? errorCode) {
  //   return AbstractMssqlException(reason, sqlState, errorCode, null);
  // }

  // /// Creates a new exception.
  // ///
  // /// @param reason    the reason for the error.  Set as the exception's message and retrieved with {@link #getMessage()}.
  // /// @param sqlState  the "SQLstate" string, which follows either the XOPEN SQLstate conventions or the SQL:2003 conventions
  // /// @param errorCode a vendor-specific error code representing this failure
  // /// @param cause     the cause
  // AbstractMssqlException(
  //     String reason, String sqlState, int errorCode, Exception cause) {
  //   super(reason, sqlState, errorCode, cause);
  // }

  // /// Creates a new exception.
  // ///
  // /// @param reason   the reason for the error.  Set as the exception's message and retrieved with {@link #getMessage()}.
  // /// @param sqlState the "SQLstate" string, which follows either the XOPEN SQLstate conventions or the SQL:2003 conventions
  // /// @param cause    the cause
  // AbstractMssqlException(String reason, String sqlState, Exception cause) {
  //   this(reason, sqlState, 0, cause);
  // }

  // /// Creates a new exception.
  // ///
  // /// @param reason the reason for the error.  Set as the exception's message and retrieved with {@link #getMessage()}.
  // /// @param cause  the cause
  // AbstractMssqlException(String reason, Exception cause) {
  //   this(reason, null, cause);
  // }

  // /// Creates a new exception.
  // ///
  // /// @param cause the cause
  // AbstractMssqlException(Exception cause) {
  //   this(null, cause);
  // }
}

class RuntimeException implements Exception {}
