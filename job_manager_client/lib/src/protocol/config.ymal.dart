/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class ServerConfig implements _i1.SerializableModel {
  ServerConfig._({
    this.id,
    required this.key,
    required this.value,
    required this.userId,
  });

  factory ServerConfig({
    int? id,
    required String key,
    required String value,
    required int userId,
  }) = _ServerConfigImpl;

  factory ServerConfig.fromJson(Map<String, dynamic> jsonSerialization) {
    return ServerConfig(
      id: jsonSerialization['id'] as int?,
      key: jsonSerialization['key'] as String,
      value: jsonSerialization['value'] as String,
      userId: jsonSerialization['userId'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String key;

  String value;

  int userId;

  /// Returns a shallow copy of this [ServerConfig]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ServerConfig copyWith({
    int? id,
    String? key,
    String? value,
    int? userId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'key': key,
      'value': value,
      'userId': userId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ServerConfigImpl extends ServerConfig {
  _ServerConfigImpl({
    int? id,
    required String key,
    required String value,
    required int userId,
  }) : super._(
          id: id,
          key: key,
          value: value,
          userId: userId,
        );

  /// Returns a shallow copy of this [ServerConfig]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ServerConfig copyWith({
    Object? id = _Undefined,
    String? key,
    String? value,
    int? userId,
  }) {
    return ServerConfig(
      id: id is int? ? id : this.id,
      key: key ?? this.key,
      value: value ?? this.value,
      userId: userId ?? this.userId,
    );
  }
}
