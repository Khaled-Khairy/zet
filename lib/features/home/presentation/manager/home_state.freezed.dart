// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeState {
  BrandViewMode get brandViewMode;
  BrandDetailsTab get brandDetailsTab;
  bool get isSubscribed;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeStateCopyWith<HomeState> get copyWith =>
      _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeState &&
            (identical(other.brandViewMode, brandViewMode) ||
                other.brandViewMode == brandViewMode) &&
            (identical(other.brandDetailsTab, brandDetailsTab) ||
                other.brandDetailsTab == brandDetailsTab) &&
            (identical(other.isSubscribed, isSubscribed) ||
                other.isSubscribed == isSubscribed));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, brandViewMode, brandDetailsTab, isSubscribed);

  @override
  String toString() {
    return 'HomeState(brandViewMode: $brandViewMode, brandDetailsTab: $brandDetailsTab, isSubscribed: $isSubscribed)';
  }
}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) =
      _$HomeStateCopyWithImpl;
  @useResult
  $Res call(
      {BrandViewMode brandViewMode,
      BrandDetailsTab brandDetailsTab,
      bool isSubscribed});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brandViewMode = null,
    Object? brandDetailsTab = null,
    Object? isSubscribed = null,
  }) {
    return _then(_self.copyWith(
      brandViewMode: null == brandViewMode
          ? _self.brandViewMode
          : brandViewMode // ignore: cast_nullable_to_non_nullable
              as BrandViewMode,
      brandDetailsTab: null == brandDetailsTab
          ? _self.brandDetailsTab
          : brandDetailsTab // ignore: cast_nullable_to_non_nullable
              as BrandDetailsTab,
      isSubscribed: null == isSubscribed
          ? _self.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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
    TResult Function(_HomeState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeState() when $default != null:
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
    TResult Function(_HomeState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeState():
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
    TResult? Function(_HomeState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeState() when $default != null:
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
    TResult Function(BrandViewMode brandViewMode,
            BrandDetailsTab brandDetailsTab, bool isSubscribed)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeState() when $default != null:
        return $default(
            _that.brandViewMode, _that.brandDetailsTab, _that.isSubscribed);
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
    TResult Function(BrandViewMode brandViewMode,
            BrandDetailsTab brandDetailsTab, bool isSubscribed)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeState():
        return $default(
            _that.brandViewMode, _that.brandDetailsTab, _that.isSubscribed);
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
    TResult? Function(BrandViewMode brandViewMode,
            BrandDetailsTab brandDetailsTab, bool isSubscribed)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeState() when $default != null:
        return $default(
            _that.brandViewMode, _that.brandDetailsTab, _that.isSubscribed);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _HomeState implements HomeState {
  const _HomeState(
      {this.brandViewMode = BrandViewMode.list,
      this.brandDetailsTab = BrandDetailsTab.challenges,
      this.isSubscribed = false});

  @override
  @JsonKey()
  final BrandViewMode brandViewMode;
  @override
  @JsonKey()
  final BrandDetailsTab brandDetailsTab;
  @override
  @JsonKey()
  final bool isSubscribed;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeState &&
            (identical(other.brandViewMode, brandViewMode) ||
                other.brandViewMode == brandViewMode) &&
            (identical(other.brandDetailsTab, brandDetailsTab) ||
                other.brandDetailsTab == brandDetailsTab) &&
            (identical(other.isSubscribed, isSubscribed) ||
                other.isSubscribed == isSubscribed));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, brandViewMode, brandDetailsTab, isSubscribed);

  @override
  String toString() {
    return 'HomeState(brandViewMode: $brandViewMode, brandDetailsTab: $brandDetailsTab, isSubscribed: $isSubscribed)';
  }
}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) _then) =
      __$HomeStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {BrandViewMode brandViewMode,
      BrandDetailsTab brandDetailsTab,
      bool isSubscribed});
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? brandViewMode = null,
    Object? brandDetailsTab = null,
    Object? isSubscribed = null,
  }) {
    return _then(_HomeState(
      brandViewMode: null == brandViewMode
          ? _self.brandViewMode
          : brandViewMode // ignore: cast_nullable_to_non_nullable
              as BrandViewMode,
      brandDetailsTab: null == brandDetailsTab
          ? _self.brandDetailsTab
          : brandDetailsTab // ignore: cast_nullable_to_non_nullable
              as BrandDetailsTab,
      isSubscribed: null == isSubscribed
          ? _self.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
