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
import 'stage.ymal.dart' as _i2;
import 'stage_perms.ymal.dart' as _i3;

abstract class StageView implements _i1.SerializableModel {
  StageView._({
    required this.stages,
    required this.perms,
  });

  factory StageView({
    required List<_i2.Stage> stages,
    required _i3.StagePerms perms,
  }) = _StageViewImpl;

  factory StageView.fromJson(Map<String, dynamic> jsonSerialization) {
    return StageView(
      stages: (jsonSerialization['stages'] as List)
          .map((e) => _i2.Stage.fromJson((e as Map<String, dynamic>)))
          .toList(),
      perms: _i3.StagePerms.fromJson(
          (jsonSerialization['perms'] as Map<String, dynamic>)),
    );
  }

  List<_i2.Stage> stages;

  _i3.StagePerms perms;

  /// Returns a shallow copy of this [StageView]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StageView copyWith({
    List<_i2.Stage>? stages,
    _i3.StagePerms? perms,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'stages': stages.toJson(valueToJson: (v) => v.toJson()),
      'perms': perms.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _StageViewImpl extends StageView {
  _StageViewImpl({
    required List<_i2.Stage> stages,
    required _i3.StagePerms perms,
  }) : super._(
          stages: stages,
          perms: perms,
        );

  /// Returns a shallow copy of this [StageView]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StageView copyWith({
    List<_i2.Stage>? stages,
    _i3.StagePerms? perms,
  }) {
    return StageView(
      stages: stages ?? this.stages.map((e0) => e0.copyWith()).toList(),
      perms: perms ?? this.perms.copyWith(),
    );
  }
}
