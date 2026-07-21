// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenges_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChallengesState {
  ChallengeFilter get filter;

  /// Create a copy of ChallengesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChallengesStateCopyWith<ChallengesState> get copyWith =>
      _$ChallengesStateCopyWithImpl<ChallengesState>(
          this as ChallengesState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChallengesState &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @override
  String toString() {
    return 'ChallengesState(filter: $filter)';
  }
}

/// @nodoc
abstract mixin class $ChallengesStateCopyWith<$Res> {
  factory $ChallengesStateCopyWith(
          ChallengesState value, $Res Function(ChallengesState) _then) =
      _$ChallengesStateCopyWithImpl;
  @useResult
  $Res call({ChallengeFilter filter});
}

/// @nodoc
class _$ChallengesStateCopyWithImpl<$Res>
    implements $ChallengesStateCopyWith<$Res> {
  _$ChallengesStateCopyWithImpl(this._self, this._then);

  final ChallengesState _self;
  final $Res Function(ChallengesState) _then;

  /// Create a copy of ChallengesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_self.copyWith(
      filter: null == filter
          ? _self.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ChallengeFilter,
    ));
  }
}

/// Adds pattern-matching-related methods to [ChallengesState].
extension ChallengesStatePatterns on ChallengesState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ChallengesState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChallengesState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ChallengesState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChallengesState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ChallengesState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChallengesState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(ChallengeFilter filter)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChallengesState() when $default != null:
        return $default(_that.filter);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(ChallengeFilter filter) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChallengesState():
        return $default(_that.filter);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(ChallengeFilter filter)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChallengesState() when $default != null:
        return $default(_that.filter);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChallengesState implements ChallengesState {
  const _ChallengesState({this.filter = ChallengeFilter.current});

  @override
  @JsonKey()
  final ChallengeFilter filter;

  /// Create a copy of ChallengesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChallengesStateCopyWith<_ChallengesState> get copyWith =>
      __$ChallengesStateCopyWithImpl<_ChallengesState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChallengesState &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @override
  String toString() {
    return 'ChallengesState(filter: $filter)';
  }
}

/// @nodoc
abstract mixin class _$ChallengesStateCopyWith<$Res>
    implements $ChallengesStateCopyWith<$Res> {
  factory _$ChallengesStateCopyWith(
          _ChallengesState value, $Res Function(_ChallengesState) _then) =
      __$ChallengesStateCopyWithImpl;
  @override
  @useResult
  $Res call({ChallengeFilter filter});
}

/// @nodoc
class __$ChallengesStateCopyWithImpl<$Res>
    implements _$ChallengesStateCopyWith<$Res> {
  __$ChallengesStateCopyWithImpl(this._self, this._then);

  final _ChallengesState _self;
  final $Res Function(_ChallengesState) _then;

  /// Create a copy of ChallengesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? filter = null,
  }) {
    return _then(_ChallengesState(
      filter: null == filter
          ? _self.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ChallengeFilter,
    ));
  }
}

// dart format on
