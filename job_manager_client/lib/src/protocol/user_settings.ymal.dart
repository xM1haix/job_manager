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

abstract class UserSettings implements _i1.SerializableModel {
  UserSettings._({
    this.email,
    this.username,
  });

  factory UserSettings({
    String? email,
    String? username,
  }) = _UserSettingsImpl;

  factory UserSettings.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserSettings(
      email: jsonSerialization['email'] as String?,
      username: jsonSerialization['username'] as String?,
    );
  }

  String? email;

  String? username;

  /// Returns a shallow copy of this [UserSettings]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserSettings copyWith({
    String? email,
    String? username,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (email != null) 'email': email,
      if (username != null) 'username': username,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserSettingsImpl extends UserSettings {
  _UserSettingsImpl({
    String? email,
    String? username,
  }) : super._(
          email: email,
          username: username,
        );

  /// Returns a shallow copy of this [UserSettings]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserSettings copyWith({
    Object? email = _Undefined,
    Object? username = _Undefined,
  }) {
    return UserSettings(
      email: email is String? ? email : this.email,
      username: username is String? ? username : this.username,
    );
  }
}
