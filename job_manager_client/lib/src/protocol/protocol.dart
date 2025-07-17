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
import 'CRUD_users_permission.ymal.dart' as _i2;
import 'bug_report.ymal.dart' as _i3;
import 'changelog.ymal.dart' as _i4;
import 'config.ymal.dart' as _i5;
import 'custom_exception.ymal.dart' as _i6;
import 'job.ymal.dart' as _i7;
import 'stage.ymal.dart' as _i8;
import 'stage_perms.ymal.dart' as _i9;
import 'stage_view.ymal.dart' as _i10;
import 'team.ymal.dart' as _i11;
import 'team_user.ymal.dart' as _i12;
import 'user_role.ymal.dart' as _i13;
import 'user_role_enum.ymal.dart' as _i14;
import 'user_settings.ymal.dart' as _i15;
import 'package:job_manager_client/src/protocol/job.ymal.dart' as _i16;
import 'package:job_manager_client/src/protocol/team.ymal.dart' as _i17;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i18;
export 'CRUD_users_permission.ymal.dart';
export 'bug_report.ymal.dart';
export 'changelog.ymal.dart';
export 'config.ymal.dart';
export 'custom_exception.ymal.dart';
export 'job.ymal.dart';
export 'stage.ymal.dart';
export 'stage_perms.ymal.dart';
export 'stage_view.ymal.dart';
export 'team.ymal.dart';
export 'team_user.ymal.dart';
export 'user_role.ymal.dart';
export 'user_role_enum.ymal.dart';
export 'user_settings.ymal.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.CRUDUsersPermission) {
      return _i2.CRUDUsersPermission.fromJson(data) as T;
    }
    if (t == _i3.BugReport) {
      return _i3.BugReport.fromJson(data) as T;
    }
    if (t == _i4.Chnagelog) {
      return _i4.Chnagelog.fromJson(data) as T;
    }
    if (t == _i5.ServerConfig) {
      return _i5.ServerConfig.fromJson(data) as T;
    }
    if (t == _i6.CustomException) {
      return _i6.CustomException.fromJson(data) as T;
    }
    if (t == _i7.Job) {
      return _i7.Job.fromJson(data) as T;
    }
    if (t == _i8.Stage) {
      return _i8.Stage.fromJson(data) as T;
    }
    if (t == _i9.StagePerms) {
      return _i9.StagePerms.fromJson(data) as T;
    }
    if (t == _i10.StageView) {
      return _i10.StageView.fromJson(data) as T;
    }
    if (t == _i11.Team) {
      return _i11.Team.fromJson(data) as T;
    }
    if (t == _i12.TeamUser) {
      return _i12.TeamUser.fromJson(data) as T;
    }
    if (t == _i13.UserRole) {
      return _i13.UserRole.fromJson(data) as T;
    }
    if (t == _i14.UserRoleEnum) {
      return _i14.UserRoleEnum.fromJson(data) as T;
    }
    if (t == _i15.UserSettings) {
      return _i15.UserSettings.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.CRUDUsersPermission?>()) {
      return (data != null ? _i2.CRUDUsersPermission.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i3.BugReport?>()) {
      return (data != null ? _i3.BugReport.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Chnagelog?>()) {
      return (data != null ? _i4.Chnagelog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.ServerConfig?>()) {
      return (data != null ? _i5.ServerConfig.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.CustomException?>()) {
      return (data != null ? _i6.CustomException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Job?>()) {
      return (data != null ? _i7.Job.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Stage?>()) {
      return (data != null ? _i8.Stage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.StagePerms?>()) {
      return (data != null ? _i9.StagePerms.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.StageView?>()) {
      return (data != null ? _i10.StageView.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Team?>()) {
      return (data != null ? _i11.Team.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.TeamUser?>()) {
      return (data != null ? _i12.TeamUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.UserRole?>()) {
      return (data != null ? _i13.UserRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.UserRoleEnum?>()) {
      return (data != null ? _i14.UserRoleEnum.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.UserSettings?>()) {
      return (data != null ? _i15.UserSettings.fromJson(data) : null) as T;
    }
    if (t == List<_i8.Stage>) {
      return (data as List).map((e) => deserialize<_i8.Stage>(e)).toList() as T;
    }
    if (t == List<_i16.Job>) {
      return (data as List).map((e) => deserialize<_i16.Job>(e)).toList() as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i17.Team>) {
      return (data as List).map((e) => deserialize<_i17.Team>(e)).toList() as T;
    }
    if (t == List<_i18.UserInfo>) {
      return (data as List).map((e) => deserialize<_i18.UserInfo>(e)).toList()
          as T;
    }
    try {
      return _i18.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.CRUDUsersPermission) {
      return 'CRUDUsersPermission';
    }
    if (data is _i3.BugReport) {
      return 'BugReport';
    }
    if (data is _i4.Chnagelog) {
      return 'Chnagelog';
    }
    if (data is _i5.ServerConfig) {
      return 'ServerConfig';
    }
    if (data is _i6.CustomException) {
      return 'CustomException';
    }
    if (data is _i7.Job) {
      return 'Job';
    }
    if (data is _i8.Stage) {
      return 'Stage';
    }
    if (data is _i9.StagePerms) {
      return 'StagePerms';
    }
    if (data is _i10.StageView) {
      return 'StageView';
    }
    if (data is _i11.Team) {
      return 'Team';
    }
    if (data is _i12.TeamUser) {
      return 'TeamUser';
    }
    if (data is _i13.UserRole) {
      return 'UserRole';
    }
    if (data is _i14.UserRoleEnum) {
      return 'UserRoleEnum';
    }
    if (data is _i15.UserSettings) {
      return 'UserSettings';
    }
    className = _i18.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'CRUDUsersPermission') {
      return deserialize<_i2.CRUDUsersPermission>(data['data']);
    }
    if (dataClassName == 'BugReport') {
      return deserialize<_i3.BugReport>(data['data']);
    }
    if (dataClassName == 'Chnagelog') {
      return deserialize<_i4.Chnagelog>(data['data']);
    }
    if (dataClassName == 'ServerConfig') {
      return deserialize<_i5.ServerConfig>(data['data']);
    }
    if (dataClassName == 'CustomException') {
      return deserialize<_i6.CustomException>(data['data']);
    }
    if (dataClassName == 'Job') {
      return deserialize<_i7.Job>(data['data']);
    }
    if (dataClassName == 'Stage') {
      return deserialize<_i8.Stage>(data['data']);
    }
    if (dataClassName == 'StagePerms') {
      return deserialize<_i9.StagePerms>(data['data']);
    }
    if (dataClassName == 'StageView') {
      return deserialize<_i10.StageView>(data['data']);
    }
    if (dataClassName == 'Team') {
      return deserialize<_i11.Team>(data['data']);
    }
    if (dataClassName == 'TeamUser') {
      return deserialize<_i12.TeamUser>(data['data']);
    }
    if (dataClassName == 'UserRole') {
      return deserialize<_i13.UserRole>(data['data']);
    }
    if (dataClassName == 'UserRoleEnum') {
      return deserialize<_i14.UserRoleEnum>(data['data']);
    }
    if (dataClassName == 'UserSettings') {
      return deserialize<_i15.UserSettings>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i18.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
