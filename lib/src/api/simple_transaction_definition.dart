// ignore_for_file: non_constant_identifier_names

import 'dart:collection';

import 'package:dart_mssql/src/api/mssql_transaction_definition.dart';
import 'package:dartedious_spi/assert.dart';
import 'package:dartedious_spi/isolation_level.dart';
import 'package:dartedious_spi/options.dart';
import 'package:dartedious_spi/transaction_definition.dart';

final class SimpleTransactionDefinition extends MssqlTransactionDefinition {
  final Map<Option<Any>, Object> _options;

  static final SimpleTransactionDefinition EMPTY =
      SimpleTransactionDefinition({});

  SimpleTransactionDefinition(Map<Option<Any>, Object> options)
      : _options = options;

  @override
  T? getAttribute<T>(Option<T> option) {
    return _options[option] as T?;
  }

  MssqlTransactionDefinition with_(Option<Any> option, Object? value) {
    Map<Option<Any>, Object> options = HashMap.from(_options);
    options.putIfAbsent(
        Assert.requireNonNull(option, "option must not be null"),
        () => Assert.requireNonNull(value, "value must not be null"));

    return SimpleTransactionDefinition(options);
  }

  @override
  MssqlTransactionDefinition isolationLevel(IsolationLevel isolationLevel) {
    return with_(MssqlTransactionDefinition().ISOLATION_LEVEL, isolationLevel);
  }

  @override
  MssqlTransactionDefinition lockTimeout(Duration timeout) {
    return with_(MssqlTransactionDefinition().LOCK_WAIT_TIMEOUT, timeout);
  }

  @override
  MssqlTransactionDefinition name(String name) {
    return with_(MssqlTransactionDefinition().NAME, name);
  }

  @override
  MssqlTransactionDefinition mark(String mark) {
    if (getAttribute(TransactionDefinition().NAME) == null) {
      name(mark);
    }

    return with_(MARK, mark);
  }
}
