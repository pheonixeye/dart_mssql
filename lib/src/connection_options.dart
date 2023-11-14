/// @author Mark Paluch
class ConnectionOptions {
  final Predicate<String> _preferCursoredExecution;

  final Codecs _codecs;

  final PreparedStatementCache _preparedStatementCache;

  final bool _sendStringParametersAsUnicode;

  Duration? _statementTimeout = Duration(microseconds: 0);

  ConnectionOptions(
      Predicate<String> preferCursoredExecution,
      Codecs codecs,
      PreparedStatementCache preparedStatementCache,
      bool sendStringParametersAsUnicode)
      : _preferCursoredExecution = preferCursoredExecution,
        _codecs = codecs,
        _preparedStatementCache = preparedStatementCache,
        _sendStringParametersAsUnicode = sendStringParametersAsUnicode;

  Codecs getCodecs() {
    return _codecs;
  }

  PreparedStatementCache getPreparedStatementCache() {
    return _preparedStatementCache;
  }

  bool prefersCursors(String sql) {
    return _preferCursoredExecution.test(sql);
  }

  bool isSendStringParametersAsUnicode() {
    return _sendStringParametersAsUnicode;
  }

  Duration? getStatementTimeout() {
    return _statementTimeout;
  }

  void setStatementTimeout(Duration? statementTimeout) {
    _statementTimeout = statementTimeout;
  }

  @override
  String toString() {
    final StringBuffer sb = StringBuffer();
    sb
      ..write("ConnectionOptions")
      ..write(" [preferCursoredExecution=")
      ..write(_preferCursoredExecution)
      ..write(", codecs=")
      ..write(_codecs)
      ..write(", preparedStatementCache=")
      ..write(_preparedStatementCache)
      ..write(", sendStringParametersAsUnicode=")
      ..write(_sendStringParametersAsUnicode)
      ..write(", statementTimeout=")
      ..write(_statementTimeout)
      ..write(']');
    return sb.toString();
  }
}

class Codecs {}

class Predicate<T> {
  bool test(String sql) {
    return true;
  }
}

class PreparedStatementCache {}
