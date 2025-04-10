/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class StagePerms
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  StagePerms._({
    required this.update,
    required this.delete,
    required this.progress,
  });

  factory StagePerms({
    required bool update,
    required bool delete,
    required bool progress,
  }) = _StagePermsImpl;

  factory StagePerms.fromJson(Map<String, dynamic> jsonSerialization) {
    return StagePerms(
      update: jsonSerialization['update'] as bool,
      delete: jsonSerialization['delete'] as bool,
      progress: jsonSerialization['progress'] as bool,
    );
  }

  bool update;

  bool delete;

  bool progress;

  /// Returns a shallow copy of this [StagePerms]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StagePerms copyWith({
    bool? update,
    bool? delete,
    bool? progress,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'update': update,
      'delete': delete,
      'progress': progress,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'update': update,
      'delete': delete,
      'progress': progress,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _StagePermsImpl extends StagePerms {
  _StagePermsImpl({
    required bool update,
    required bool delete,
    required bool progress,
  }) : super._(
          update: update,
          delete: delete,
          progress: progress,
        );

  /// Returns a shallow copy of this [StagePerms]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StagePerms copyWith({
    bool? update,
    bool? delete,
    bool? progress,
  }) {
    return StagePerms(
      update: update ?? this.update,
      delete: delete ?? this.delete,
      progress: progress ?? this.progress,
    );
  }
}
