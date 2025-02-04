// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'referral_management.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReferralEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReferralModel referral, bool isEditing)
        handleSubmit,
    required TResult Function(ReferralSearchModel referrals) handleSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReferralModel referral, bool isEditing)? handleSubmit,
    TResult? Function(ReferralSearchModel referrals)? handleSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReferralModel referral, bool isEditing)? handleSubmit,
    TResult Function(ReferralSearchModel referrals)? handleSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReferralSubmitEvent value) handleSubmit,
    required TResult Function(ReferralSearchEvent value) handleSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReferralSubmitEvent value)? handleSubmit,
    TResult? Function(ReferralSearchEvent value)? handleSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReferralSubmitEvent value)? handleSubmit,
    TResult Function(ReferralSearchEvent value)? handleSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralEventCopyWith<$Res> {
  factory $ReferralEventCopyWith(
          ReferralEvent value, $Res Function(ReferralEvent) then) =
      _$ReferralEventCopyWithImpl<$Res, ReferralEvent>;
}

/// @nodoc
class _$ReferralEventCopyWithImpl<$Res, $Val extends ReferralEvent>
    implements $ReferralEventCopyWith<$Res> {
  _$ReferralEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ReferralSubmitEventCopyWith<$Res> {
  factory _$$ReferralSubmitEventCopyWith(_$ReferralSubmitEvent value,
          $Res Function(_$ReferralSubmitEvent) then) =
      __$$ReferralSubmitEventCopyWithImpl<$Res>;
  @useResult
  $Res call({ReferralModel referral, bool isEditing});
}

/// @nodoc
class __$$ReferralSubmitEventCopyWithImpl<$Res>
    extends _$ReferralEventCopyWithImpl<$Res, _$ReferralSubmitEvent>
    implements _$$ReferralSubmitEventCopyWith<$Res> {
  __$$ReferralSubmitEventCopyWithImpl(
      _$ReferralSubmitEvent _value, $Res Function(_$ReferralSubmitEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referral = null,
    Object? isEditing = null,
  }) {
    return _then(_$ReferralSubmitEvent(
      null == referral
          ? _value.referral
          : referral // ignore: cast_nullable_to_non_nullable
              as ReferralModel,
      null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ReferralSubmitEvent implements ReferralSubmitEvent {
  const _$ReferralSubmitEvent(this.referral, this.isEditing);

  @override
  final ReferralModel referral;
  @override
  final bool isEditing;

  @override
  String toString() {
    return 'ReferralEvent.handleSubmit(referral: $referral, isEditing: $isEditing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralSubmitEvent &&
            (identical(other.referral, referral) ||
                other.referral == referral) &&
            (identical(other.isEditing, isEditing) ||
                other.isEditing == isEditing));
  }

  @override
  int get hashCode => Object.hash(runtimeType, referral, isEditing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralSubmitEventCopyWith<_$ReferralSubmitEvent> get copyWith =>
      __$$ReferralSubmitEventCopyWithImpl<_$ReferralSubmitEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReferralModel referral, bool isEditing)
        handleSubmit,
    required TResult Function(ReferralSearchModel referrals) handleSearch,
  }) {
    return handleSubmit(referral, isEditing);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReferralModel referral, bool isEditing)? handleSubmit,
    TResult? Function(ReferralSearchModel referrals)? handleSearch,
  }) {
    return handleSubmit?.call(referral, isEditing);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReferralModel referral, bool isEditing)? handleSubmit,
    TResult Function(ReferralSearchModel referrals)? handleSearch,
    required TResult orElse(),
  }) {
    if (handleSubmit != null) {
      return handleSubmit(referral, isEditing);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReferralSubmitEvent value) handleSubmit,
    required TResult Function(ReferralSearchEvent value) handleSearch,
  }) {
    return handleSubmit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReferralSubmitEvent value)? handleSubmit,
    TResult? Function(ReferralSearchEvent value)? handleSearch,
  }) {
    return handleSubmit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReferralSubmitEvent value)? handleSubmit,
    TResult Function(ReferralSearchEvent value)? handleSearch,
    required TResult orElse(),
  }) {
    if (handleSubmit != null) {
      return handleSubmit(this);
    }
    return orElse();
  }
}

abstract class ReferralSubmitEvent implements ReferralEvent {
  const factory ReferralSubmitEvent(
          final ReferralModel referral, final bool isEditing) =
      _$ReferralSubmitEvent;

  ReferralModel get referral;
  bool get isEditing;
  @JsonKey(ignore: true)
  _$$ReferralSubmitEventCopyWith<_$ReferralSubmitEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReferralSearchEventCopyWith<$Res> {
  factory _$$ReferralSearchEventCopyWith(_$ReferralSearchEvent value,
          $Res Function(_$ReferralSearchEvent) then) =
      __$$ReferralSearchEventCopyWithImpl<$Res>;
  @useResult
  $Res call({ReferralSearchModel referrals});
}

/// @nodoc
class __$$ReferralSearchEventCopyWithImpl<$Res>
    extends _$ReferralEventCopyWithImpl<$Res, _$ReferralSearchEvent>
    implements _$$ReferralSearchEventCopyWith<$Res> {
  __$$ReferralSearchEventCopyWithImpl(
      _$ReferralSearchEvent _value, $Res Function(_$ReferralSearchEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referrals = null,
  }) {
    return _then(_$ReferralSearchEvent(
      null == referrals
          ? _value.referrals
          : referrals // ignore: cast_nullable_to_non_nullable
              as ReferralSearchModel,
    ));
  }
}

/// @nodoc

class _$ReferralSearchEvent implements ReferralSearchEvent {
  const _$ReferralSearchEvent(this.referrals);

  @override
  final ReferralSearchModel referrals;

  @override
  String toString() {
    return 'ReferralEvent.handleSearch(referrals: $referrals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralSearchEvent &&
            (identical(other.referrals, referrals) ||
                other.referrals == referrals));
  }

  @override
  int get hashCode => Object.hash(runtimeType, referrals);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralSearchEventCopyWith<_$ReferralSearchEvent> get copyWith =>
      __$$ReferralSearchEventCopyWithImpl<_$ReferralSearchEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReferralModel referral, bool isEditing)
        handleSubmit,
    required TResult Function(ReferralSearchModel referrals) handleSearch,
  }) {
    return handleSearch(referrals);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReferralModel referral, bool isEditing)? handleSubmit,
    TResult? Function(ReferralSearchModel referrals)? handleSearch,
  }) {
    return handleSearch?.call(referrals);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReferralModel referral, bool isEditing)? handleSubmit,
    TResult Function(ReferralSearchModel referrals)? handleSearch,
    required TResult orElse(),
  }) {
    if (handleSearch != null) {
      return handleSearch(referrals);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReferralSubmitEvent value) handleSubmit,
    required TResult Function(ReferralSearchEvent value) handleSearch,
  }) {
    return handleSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReferralSubmitEvent value)? handleSubmit,
    TResult? Function(ReferralSearchEvent value)? handleSearch,
  }) {
    return handleSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReferralSubmitEvent value)? handleSubmit,
    TResult Function(ReferralSearchEvent value)? handleSearch,
    required TResult orElse(),
  }) {
    if (handleSearch != null) {
      return handleSearch(this);
    }
    return orElse();
  }
}

abstract class ReferralSearchEvent implements ReferralEvent {
  const factory ReferralSearchEvent(final ReferralSearchModel referrals) =
      _$ReferralSearchEvent;

  ReferralSearchModel get referrals;
  @JsonKey(ignore: true)
  _$$ReferralSearchEventCopyWith<_$ReferralSearchEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReferralState {
  bool get loading => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;
  List<ReferralModel>? get referrals => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReferralStateCopyWith<ReferralState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralStateCopyWith<$Res> {
  factory $ReferralStateCopyWith(
          ReferralState value, $Res Function(ReferralState) then) =
      _$ReferralStateCopyWithImpl<$Res, ReferralState>;
  @useResult
  $Res call({bool loading, bool isEditing, List<ReferralModel>? referrals});
}

/// @nodoc
class _$ReferralStateCopyWithImpl<$Res, $Val extends ReferralState>
    implements $ReferralStateCopyWith<$Res> {
  _$ReferralStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? isEditing = null,
    Object? referrals = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      referrals: freezed == referrals
          ? _value.referrals
          : referrals // ignore: cast_nullable_to_non_nullable
              as List<ReferralModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReferralStateCopyWith<$Res>
    implements $ReferralStateCopyWith<$Res> {
  factory _$$_ReferralStateCopyWith(
          _$_ReferralState value, $Res Function(_$_ReferralState) then) =
      __$$_ReferralStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, bool isEditing, List<ReferralModel>? referrals});
}

/// @nodoc
class __$$_ReferralStateCopyWithImpl<$Res>
    extends _$ReferralStateCopyWithImpl<$Res, _$_ReferralState>
    implements _$$_ReferralStateCopyWith<$Res> {
  __$$_ReferralStateCopyWithImpl(
      _$_ReferralState _value, $Res Function(_$_ReferralState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? isEditing = null,
    Object? referrals = freezed,
  }) {
    return _then(_$_ReferralState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      referrals: freezed == referrals
          ? _value._referrals
          : referrals // ignore: cast_nullable_to_non_nullable
              as List<ReferralModel>?,
    ));
  }
}

/// @nodoc

class _$_ReferralState implements _ReferralState {
  const _$_ReferralState(
      {this.loading = false,
      this.isEditing = false,
      final List<ReferralModel>? referrals})
      : _referrals = referrals;

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool isEditing;
  final List<ReferralModel>? _referrals;
  @override
  List<ReferralModel>? get referrals {
    final value = _referrals;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ReferralState(loading: $loading, isEditing: $isEditing, referrals: $referrals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReferralState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.isEditing, isEditing) ||
                other.isEditing == isEditing) &&
            const DeepCollectionEquality()
                .equals(other._referrals, _referrals));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, isEditing,
      const DeepCollectionEquality().hash(_referrals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReferralStateCopyWith<_$_ReferralState> get copyWith =>
      __$$_ReferralStateCopyWithImpl<_$_ReferralState>(this, _$identity);
}

abstract class _ReferralState implements ReferralState {
  const factory _ReferralState(
      {final bool loading,
      final bool isEditing,
      final List<ReferralModel>? referrals}) = _$_ReferralState;

  @override
  bool get loading;
  @override
  bool get isEditing;
  @override
  List<ReferralModel>? get referrals;
  @override
  @JsonKey(ignore: true)
  _$$_ReferralStateCopyWith<_$_ReferralState> get copyWith =>
      throw _privateConstructorUsedError;
}
