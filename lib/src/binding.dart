import 'package:dartedious_spi/java/biconsumer.dart';

/// A collection of {@link Encoded encoded parameters} for a single bind
/// invocation of a prepared statement.
/// Bindings for Microsoft SQL Server are name-based and names are handled
/// without the prefixing at-sign. The at sign is added during encoding.
///
/// @author Mark Paluch
class Binding {
  final Map<String, RpcParameter> parameters = <String, RpcParameter>{};

  bool _hasOutParameters = false;

  String? formalRepresentation;

  /// Add a {@link Encoded encoded parameter} to the binding.
  ///
  /// @param name      the name of the {@link Encoded encoded parameter}
  /// @param direction the direction of the encoded parameter
  /// @param parameter the {@link Encoded encoded parameter}
  /// @return this {@link Binding}

  Binding add(String name, RpcDirection direction, Encoded parameter) {
    formalRepresentation = null;
    parameters.addEntries([MapEntry(name, RpcParameter(direction, parameter))]);
    if (direction == RpcDirection.OUT) {
      _hasOutParameters = true;
    }
    return this;
  }

  /// Returns parameter names of the return values.
  ///
  /// @return

  bool hasOutParameters() {
    return _hasOutParameters;
  }

  /// Clear/release binding values.
  void clear() {
    parameters.forEach((s, parameter) {
      if (!parameter.encoded.isDisposed()) {
        parameter.encoded.dispose();
      }
    });

    parameters.clear();
  }

  /// Returns a formal representation of the bound parameters such as
  /// {@literal @P0 VARCHAR(8000), @P1 DECIMAL(12,6)}
  ///
  /// @return a formal representation of the bound parameters.
  String getFormalParameters() {
    String? formalRepresentation = this.formalRepresentation;
    if (formalRepresentation != null) {
      return formalRepresentation;
    }

    StringBuffer builder = StringBuffer();
    Set<MapEntry<String, RpcParameter>> entries = parameters.entries.toSet();

    for (MapEntry<String, RpcParameter> entry in entries) {
      if (builder.length != 0) {
        builder.write(',');
      }

      builder
        ..write('@')
        ..write(entry.key)
        ..write(' ')
        ..write(entry.value.encoded.getFormalType());

      if (entry.value.rpcDirection == RpcDirection.OUT) {
        builder.write(" OUTPUT");
      }
    }

    formalRepresentation = builder.toString();
    this.formalRepresentation = formalRepresentation;

    return formalRepresentation;
  }

  /// Performs the given action for each entry in this binding until all
  /// bound parameters
  /// have been processed or the action throws an exception.   Unless
  /// otherwise specified by the implementing class, actions are performed in
  /// the order of entry set iteration (if an iteration order is specified.)
  ///
  /// @param action The action to be performed for each bound parameter.
  void forEach(BiConsumer<String, RpcParameter> action) {
    parameters.forEach(action);
  }

  Map<String, RpcParameter> getParameters() {
    return parameters;
  }

  /// Returns whether this {@link Binding} is empty (i.e. no parameters bound).
  ///
  /// @return {@code true} if no parameters were bound.
  bool isEmpty() {
    return parameters.isEmpty;
  }

  /// Returns the number of bound parameters.
  ///
  /// @return the number of bound parameters.
  int size() {
    return parameters.length;
  }

  @override
  bool operator ==(covariant Object other) {
    if (other is Binding) {
      if (formalRepresentation == other.formalRepresentation &&
          _hasOutParameters == other._hasOutParameters &&
          parameters == other.parameters) {
        return true;
      }
    }
    return false;
  }

  @override
  int get hashCode => Object.hashAll([parameters]);

  @override
  String toString() {
    final StringBuffer sb = StringBuffer();
    sb
      ..write("Binding")
      ..write(" [parameters=")
      ..write(parameters)
      ..write(']');
    return sb.toString();
  }
}

class RpcParameter {
  final RpcDirection rpcDirection;

  final Encoded encoded;

  RpcParameter(this.rpcDirection, this.encoded);
}
