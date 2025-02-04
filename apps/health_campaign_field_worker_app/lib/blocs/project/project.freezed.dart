// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProjectEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(ProjectModel model) selectProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(ProjectModel model)? selectProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(ProjectModel model)? selectProject,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectInitializeEvent value) initialize,
    required TResult Function(ProjectSelectProjectEvent value) selectProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectInitializeEvent value)? initialize,
    TResult? Function(ProjectSelectProjectEvent value)? selectProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectInitializeEvent value)? initialize,
    TResult Function(ProjectSelectProjectEvent value)? selectProject,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectEventCopyWith<$Res> {
  factory $ProjectEventCopyWith(
          ProjectEvent value, $Res Function(ProjectEvent) then) =
      _$ProjectEventCopyWithImpl<$Res, ProjectEvent>;
}

/// @nodoc
class _$ProjectEventCopyWithImpl<$Res, $Val extends ProjectEvent>
    implements $ProjectEventCopyWith<$Res> {
  _$ProjectEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProjectInitializeEventCopyWith<$Res> {
  factory _$$ProjectInitializeEventCopyWith(_$ProjectInitializeEvent value,
          $Res Function(_$ProjectInitializeEvent) then) =
      __$$ProjectInitializeEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProjectInitializeEventCopyWithImpl<$Res>
    extends _$ProjectEventCopyWithImpl<$Res, _$ProjectInitializeEvent>
    implements _$$ProjectInitializeEventCopyWith<$Res> {
  __$$ProjectInitializeEventCopyWithImpl(_$ProjectInitializeEvent _value,
      $Res Function(_$ProjectInitializeEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProjectInitializeEvent implements ProjectInitializeEvent {
  const _$ProjectInitializeEvent();

  @override
  String toString() {
    return 'ProjectEvent.initialize()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProjectInitializeEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(ProjectModel model) selectProject,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(ProjectModel model)? selectProject,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(ProjectModel model)? selectProject,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectInitializeEvent value) initialize,
    required TResult Function(ProjectSelectProjectEvent value) selectProject,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectInitializeEvent value)? initialize,
    TResult? Function(ProjectSelectProjectEvent value)? selectProject,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectInitializeEvent value)? initialize,
    TResult Function(ProjectSelectProjectEvent value)? selectProject,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class ProjectInitializeEvent implements ProjectEvent {
  const factory ProjectInitializeEvent() = _$ProjectInitializeEvent;
}

/// @nodoc
abstract class _$$ProjectSelectProjectEventCopyWith<$Res> {
  factory _$$ProjectSelectProjectEventCopyWith(
          _$ProjectSelectProjectEvent value,
          $Res Function(_$ProjectSelectProjectEvent) then) =
      __$$ProjectSelectProjectEventCopyWithImpl<$Res>;
  @useResult
  $Res call({ProjectModel model});
}

/// @nodoc
class __$$ProjectSelectProjectEventCopyWithImpl<$Res>
    extends _$ProjectEventCopyWithImpl<$Res, _$ProjectSelectProjectEvent>
    implements _$$ProjectSelectProjectEventCopyWith<$Res> {
  __$$ProjectSelectProjectEventCopyWithImpl(_$ProjectSelectProjectEvent _value,
      $Res Function(_$ProjectSelectProjectEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$ProjectSelectProjectEvent(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as ProjectModel,
    ));
  }
}

/// @nodoc

class _$ProjectSelectProjectEvent implements ProjectSelectProjectEvent {
  const _$ProjectSelectProjectEvent(this.model);

  @override
  final ProjectModel model;

  @override
  String toString() {
    return 'ProjectEvent.selectProject(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectSelectProjectEvent &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectSelectProjectEventCopyWith<_$ProjectSelectProjectEvent>
      get copyWith => __$$ProjectSelectProjectEventCopyWithImpl<
          _$ProjectSelectProjectEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(ProjectModel model) selectProject,
  }) {
    return selectProject(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(ProjectModel model)? selectProject,
  }) {
    return selectProject?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(ProjectModel model)? selectProject,
    required TResult orElse(),
  }) {
    if (selectProject != null) {
      return selectProject(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectInitializeEvent value) initialize,
    required TResult Function(ProjectSelectProjectEvent value) selectProject,
  }) {
    return selectProject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectInitializeEvent value)? initialize,
    TResult? Function(ProjectSelectProjectEvent value)? selectProject,
  }) {
    return selectProject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectInitializeEvent value)? initialize,
    TResult Function(ProjectSelectProjectEvent value)? selectProject,
    required TResult orElse(),
  }) {
    if (selectProject != null) {
      return selectProject(this);
    }
    return orElse();
  }
}

abstract class ProjectSelectProjectEvent implements ProjectEvent {
  const factory ProjectSelectProjectEvent(final ProjectModel model) =
      _$ProjectSelectProjectEvent;

  ProjectModel get model;
  @JsonKey(ignore: true)
  _$$ProjectSelectProjectEventCopyWith<_$ProjectSelectProjectEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProjectState {
  List<ProjectModel> get projects => throw _privateConstructorUsedError;
  ProjectType? get projectType => throw _privateConstructorUsedError;
  Cycle? get selectedCycle => throw _privateConstructorUsedError;
  ProjectModel? get selectedProject => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  ProjectSyncErrorType? get syncError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectStateCopyWith<ProjectState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectStateCopyWith<$Res> {
  factory $ProjectStateCopyWith(
          ProjectState value, $Res Function(ProjectState) then) =
      _$ProjectStateCopyWithImpl<$Res, ProjectState>;
  @useResult
  $Res call(
      {List<ProjectModel> projects,
      ProjectType? projectType,
      Cycle? selectedCycle,
      ProjectModel? selectedProject,
      bool loading,
      ProjectSyncErrorType? syncError});

  $ProjectTypeCopyWith<$Res>? get projectType;
  $CycleCopyWith<$Res>? get selectedCycle;
}

/// @nodoc
class _$ProjectStateCopyWithImpl<$Res, $Val extends ProjectState>
    implements $ProjectStateCopyWith<$Res> {
  _$ProjectStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projects = null,
    Object? projectType = freezed,
    Object? selectedCycle = freezed,
    Object? selectedProject = freezed,
    Object? loading = null,
    Object? syncError = freezed,
  }) {
    return _then(_value.copyWith(
      projects: null == projects
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<ProjectModel>,
      projectType: freezed == projectType
          ? _value.projectType
          : projectType // ignore: cast_nullable_to_non_nullable
              as ProjectType?,
      selectedCycle: freezed == selectedCycle
          ? _value.selectedCycle
          : selectedCycle // ignore: cast_nullable_to_non_nullable
              as Cycle?,
      selectedProject: freezed == selectedProject
          ? _value.selectedProject
          : selectedProject // ignore: cast_nullable_to_non_nullable
              as ProjectModel?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      syncError: freezed == syncError
          ? _value.syncError
          : syncError // ignore: cast_nullable_to_non_nullable
              as ProjectSyncErrorType?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectTypeCopyWith<$Res>? get projectType {
    if (_value.projectType == null) {
      return null;
    }

    return $ProjectTypeCopyWith<$Res>(_value.projectType!, (value) {
      return _then(_value.copyWith(projectType: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CycleCopyWith<$Res>? get selectedCycle {
    if (_value.selectedCycle == null) {
      return null;
    }

    return $CycleCopyWith<$Res>(_value.selectedCycle!, (value) {
      return _then(_value.copyWith(selectedCycle: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProjectStateCopyWith<$Res>
    implements $ProjectStateCopyWith<$Res> {
  factory _$$_ProjectStateCopyWith(
          _$_ProjectState value, $Res Function(_$_ProjectState) then) =
      __$$_ProjectStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ProjectModel> projects,
      ProjectType? projectType,
      Cycle? selectedCycle,
      ProjectModel? selectedProject,
      bool loading,
      ProjectSyncErrorType? syncError});

  @override
  $ProjectTypeCopyWith<$Res>? get projectType;
  @override
  $CycleCopyWith<$Res>? get selectedCycle;
}

/// @nodoc
class __$$_ProjectStateCopyWithImpl<$Res>
    extends _$ProjectStateCopyWithImpl<$Res, _$_ProjectState>
    implements _$$_ProjectStateCopyWith<$Res> {
  __$$_ProjectStateCopyWithImpl(
      _$_ProjectState _value, $Res Function(_$_ProjectState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projects = null,
    Object? projectType = freezed,
    Object? selectedCycle = freezed,
    Object? selectedProject = freezed,
    Object? loading = null,
    Object? syncError = freezed,
  }) {
    return _then(_$_ProjectState(
      projects: null == projects
          ? _value._projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<ProjectModel>,
      projectType: freezed == projectType
          ? _value.projectType
          : projectType // ignore: cast_nullable_to_non_nullable
              as ProjectType?,
      selectedCycle: freezed == selectedCycle
          ? _value.selectedCycle
          : selectedCycle // ignore: cast_nullable_to_non_nullable
              as Cycle?,
      selectedProject: freezed == selectedProject
          ? _value.selectedProject
          : selectedProject // ignore: cast_nullable_to_non_nullable
              as ProjectModel?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      syncError: freezed == syncError
          ? _value.syncError
          : syncError // ignore: cast_nullable_to_non_nullable
              as ProjectSyncErrorType?,
    ));
  }
}

/// @nodoc

class _$_ProjectState extends _ProjectState {
  const _$_ProjectState(
      {final List<ProjectModel> projects = const [],
      this.projectType,
      this.selectedCycle,
      this.selectedProject,
      this.loading = false,
      this.syncError})
      : _projects = projects,
        super._();

  final List<ProjectModel> _projects;
  @override
  @JsonKey()
  List<ProjectModel> get projects {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projects);
  }

  @override
  final ProjectType? projectType;
  @override
  final Cycle? selectedCycle;
  @override
  final ProjectModel? selectedProject;
  @override
  @JsonKey()
  final bool loading;
  @override
  final ProjectSyncErrorType? syncError;

  @override
  String toString() {
    return 'ProjectState(projects: $projects, projectType: $projectType, selectedCycle: $selectedCycle, selectedProject: $selectedProject, loading: $loading, syncError: $syncError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectState &&
            const DeepCollectionEquality().equals(other._projects, _projects) &&
            (identical(other.projectType, projectType) ||
                other.projectType == projectType) &&
            (identical(other.selectedCycle, selectedCycle) ||
                other.selectedCycle == selectedCycle) &&
            (identical(other.selectedProject, selectedProject) ||
                other.selectedProject == selectedProject) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.syncError, syncError) ||
                other.syncError == syncError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_projects),
      projectType,
      selectedCycle,
      selectedProject,
      loading,
      syncError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectStateCopyWith<_$_ProjectState> get copyWith =>
      __$$_ProjectStateCopyWithImpl<_$_ProjectState>(this, _$identity);
}

abstract class _ProjectState extends ProjectState {
  const factory _ProjectState(
      {final List<ProjectModel> projects,
      final ProjectType? projectType,
      final Cycle? selectedCycle,
      final ProjectModel? selectedProject,
      final bool loading,
      final ProjectSyncErrorType? syncError}) = _$_ProjectState;
  const _ProjectState._() : super._();

  @override
  List<ProjectModel> get projects;
  @override
  ProjectType? get projectType;
  @override
  Cycle? get selectedCycle;
  @override
  ProjectModel? get selectedProject;
  @override
  bool get loading;
  @override
  ProjectSyncErrorType? get syncError;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectStateCopyWith<_$_ProjectState> get copyWith =>
      throw _privateConstructorUsedError;
}
