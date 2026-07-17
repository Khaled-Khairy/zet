import 'package:flutter/material.dart';

// ============================================================================
// RequestState<T>
//
// Represents the lifecycle of an API request. Works with Freezed + BLoC/Cubit.
//
//   InitialState            → nothing requested yet
//   LoadingState            → first fetch in progress
//   SuccessState            → data arrived
//   FailureState            → request failed, no data
//   PaginationLoadingState  → fetching next page; current data preserved
//   PaginationSuccessState  → next page merged; holds full combined list
//   PaginationFailureState  → next page failed; current data preserved
//
// Usage:
//   @Default(InitialState()) RequestState<List<Product>> productsState
//   emit(state.copyWith(productsState: const LoadingState()));
//   emit(state.copyWith(productsState: SuccessState(data)));
// ============================================================================

sealed class RequestState<T> {
  const RequestState();
}

final class InitialState<T> extends RequestState<T> {
  const InitialState();

  @override
  bool operator ==(Object other) => other is InitialState<T>;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class LoadingState<T> extends RequestState<T> {
  const LoadingState();

  @override
  bool operator ==(Object other) => other is LoadingState<T>;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class SuccessState<T> extends RequestState<T> {
  final T data;

  const SuccessState(this.data);

  @override
  bool operator ==(Object other) => identical(this, other) || other is SuccessState<T> && data == other.data;

  @override
  int get hashCode => data.hashCode;
}

final class FailureState<T> extends RequestState<T> {
  final String error;

  const FailureState(this.error);

  @override
  bool operator ==(Object other) => identical(this, other) || other is FailureState<T> && error == other.error;

  @override
  int get hashCode => error.hashCode;
}

/// Fetching the next page. [currentData] holds what's already on screen so
/// the UI can keep showing it while a bottom spinner runs.
/// Prefer [RequestStateTransitions.toPaginationLoading] which carries data over.
final class PaginationLoadingState<T> extends RequestState<T> {
  final T? currentData;

  const PaginationLoadingState([this.currentData]);

  @override
  bool operator ==(Object other) => identical(this, other) || other is PaginationLoadingState<T> && currentData == other.currentData;

  @override
  int get hashCode => Object.hashAll([runtimeType, currentData]);
}

/// Next page loaded. [data] is the full merged list, not just the new page.
final class PaginationSuccessState<T> extends RequestState<T> {
  final T data;

  const PaginationSuccessState(this.data);

  @override
  bool operator ==(Object other) => identical(this, other) || other is PaginationSuccessState<T> && data == other.data;

  @override
  int get hashCode => data.hashCode;
}

/// Next-page fetch failed. [currentData] preserves what was already shown.
/// Prefer [RequestStateTransitions.toPaginationFailure] which carries data over.
final class PaginationFailureState<T> extends RequestState<T> {
  final String error;
  final T? currentData;

  const PaginationFailureState(this.error, [this.currentData]);

  @override
  bool operator ==(Object other) => identical(this, other) || other is PaginationFailureState<T> && error == other.error && currentData == other.currentData;

  @override
  int get hashCode => Object.hash(error, currentData);
}

// ============================================================================
// UI Building — when / maybeWhen
// ============================================================================

extension RequestStateBuilder<T> on RequestState<T> {
  /// Exhaustively maps every state to a Widget.
  ///
  /// Pagination handlers are optional and fall back gracefully:
  ///   • PaginationLoading → onSuccess(currentData) if present, else onLoading()
  ///   • PaginationSuccess → onSuccess(data)
  ///   • PaginationFailure → onSuccess(currentData) if present, else onFailure(error)
  ///
  /// ```dart
  /// state.productsState.when(
  ///   onLoading: () => const CircularProgressIndicator(),
  ///   onSuccess: (products) => ProductList(products),
  ///   onFailure: (error) => ErrorMessage(error),
  ///   onPaginationLoading: (current) =>
  ///       ProductList(current!, showBottomLoader: true),
  /// )
  /// ```
  Widget when({
    required Widget Function() onLoading,
    required Widget Function(T data) onSuccess,
    required Widget Function(String error) onFailure,
    Widget Function()? onInitial,
    Widget Function(T? currentData)? onPaginationLoading,
    Widget Function(T data)? onPaginationSuccess,
    Widget Function(String error, T? currentData)? onPaginationFailure,
  }) {
    return switch (this) {
      InitialState() => onInitial?.call() ?? const SizedBox.shrink(),
      LoadingState() => onLoading(),
      SuccessState(:final data) => onSuccess(data),
      FailureState(:final error) => onFailure(error),
      PaginationLoadingState(:final currentData) => onPaginationLoading?.call(currentData) ?? (currentData != null ? onSuccess(currentData) : onLoading()),
      PaginationSuccessState(:final data) => onPaginationSuccess?.call(data) ?? onSuccess(data),
      PaginationFailureState(:final error, :final currentData) =>
        onPaginationFailure?.call(error, currentData) ?? (currentData != null ? onSuccess(currentData) : onFailure(error)),
    };
  }

  /// Like [when], but every handler is optional and unhandled states fall
  /// back to [orElse].
  ///
  /// ```dart
  /// state.userState.maybeWhen(
  ///   onFailure: (error) => ErrorBanner(error),
  ///   orElse: () => const SizedBox.shrink(),
  /// )
  /// ```
  Widget maybeWhen({
    Widget Function()? onInitial,
    Widget Function()? onLoading,
    Widget Function(T data)? onSuccess,
    Widget Function(String error)? onFailure,
    Widget Function(T? currentData)? onPaginationLoading,
    Widget Function(T data)? onPaginationSuccess,
    Widget Function(String error, T? currentData)? onPaginationFailure,
    required Widget Function() orElse,
  }) {
    return switch (this) {
      InitialState() => onInitial?.call() ?? orElse(),
      LoadingState() => onLoading?.call() ?? orElse(),
      SuccessState(:final data) => onSuccess?.call(data) ?? orElse(),
      FailureState(:final error) => onFailure?.call(error) ?? orElse(),
      PaginationLoadingState(:final currentData) => onPaginationLoading?.call(currentData) ?? orElse(),
      PaginationSuccessState(:final data) => onPaginationSuccess?.call(data) ?? orElse(),
      PaginationFailureState(:final error, :final currentData) => onPaginationFailure?.call(error, currentData) ?? orElse(),
    };
  }
}

// ============================================================================
// Boolean checks & data accessors
// ============================================================================

extension RequestStateChecks<T> on RequestState<T> {
  bool get isInitial => this is InitialState<T>;

  bool get isLoading => this is LoadingState<T>;

  bool get isSuccess => this is SuccessState<T>;

  bool get isFailure => this is FailureState<T>;

  bool get isPaginationLoading => this is PaginationLoadingState<T>;

  bool get isPaginationSuccess => this is PaginationSuccessState<T>;

  bool get isPaginationFailure => this is PaginationFailureState<T>;

  bool get isAnyLoading => isLoading || isPaginationLoading;

  bool get isAnySuccess => isSuccess || isPaginationSuccess;

  bool get isAnyFailure => isFailure || isPaginationFailure;

  bool get isPaginating => isPaginationLoading || isPaginationSuccess || isPaginationFailure;

  bool get hasData => data != null;

  bool get hasError => error != null;

  /// Data if available in the current state, otherwise null. Non-null in
  /// SuccessState, PaginationSuccessState, and pagination states that
  /// already had data loaded.
  T? get data => switch (this) {
        SuccessState(:final data) => data,
        PaginationSuccessState(:final data) => data,
        PaginationLoadingState(:final currentData) => currentData,
        PaginationFailureState(:final currentData) => currentData,
        _ => null,
      };

  /// Error message when in a failure state, otherwise null.
  String? get error => switch (this) {
        FailureState(:final error) => error,
        PaginationFailureState(:final error) => error,
        _ => null,
      };

  /// Data or throws. Only use when the state is guaranteed to have data,
  /// e.g. inside an [RequestStateBuilder.onSuccess] handler.
  T get dataOrThrow => data ?? (throw StateError('No data available in $runtimeType'));

  /// Data or [defaultValue] when null.
  T dataOr(T defaultValue) => data ?? defaultValue;
}

// ============================================================================
// State transitions — convenience for use inside a Cubit.
// The toPagination* helpers automatically carry current data over.
// ============================================================================

extension RequestStateTransitions<T> on RequestState<T> {
  RequestState<T> toInitial() => const InitialState();

  RequestState<T> toLoading() => const LoadingState();

  RequestState<T> toSuccess(T data) => SuccessState(data);

  RequestState<T> toFailure(String error) => FailureState(error);

  /// ```dart
  /// emit(state.copyWith(itemsState: state.itemsState.toPaginationLoading()));
  /// ```
  RequestState<T> toPaginationLoading() => PaginationLoadingState(data);

  RequestState<T> toPaginationSuccess(T data) => PaginationSuccessState(data);

  /// ```dart
  /// emit(state.copyWith(
  ///   itemsState: state.itemsState.toPaginationFailure(e.toString()),
  /// ));
  /// ```
  RequestState<T> toPaginationFailure(String error) => PaginationFailureState(error, data);
}

// ============================================================================
// buildWhen / listenWhen helpers
// ============================================================================

extension RequestStateBlocHelpers<T> on RequestState<T> {
  /// Use in [BlocBuilder.buildWhen]: `(prev, curr) => curr.x.hasChanged(prev.x)`
  bool hasChanged(RequestState<T> other) => this != other;

  /// True when the state *type* changed (e.g. Loading → Success), ignoring
  /// data-only changes within the same type.
  bool hasTypeChanged(RequestState<T> other) => runtimeType != other.runtimeType;

  /// True when transitioning *into* any success state (incl. pagination).
  bool becameSuccess(RequestState<T> other) => !other.isAnySuccess && isAnySuccess;

  /// True when transitioning *into* any failure state (incl. pagination).
  bool becameFailure(RequestState<T> other) => !other.isAnyFailure && isAnyFailure;

  /// True when transitioning *into* any loading state (incl. pagination).
  bool becameLoading(RequestState<T> other) => !other.isAnyLoading && isAnyLoading;

  /// True specifically for Loading → Success (excludes pagination).
  bool loadingToSuccess(RequestState<T> other) => other.isLoading && isSuccess;

  /// True specifically for Loading → Failure (excludes pagination).
  bool loadingToFailure(RequestState<T> other) => other.isLoading && isFailure;

  /// True when a loading state resolves to success or failure.
  bool completed(RequestState<T> other) => other.isLoading && (isSuccess || isFailure);
}

// ============================================================================
// RequestStateWhen
//
// Selector-based factory for buildWhen / listenWhen predicates:
//   buildWhen: RequestStateWhen.changed((s) => s.productsState)
// ============================================================================

class RequestStateWhen {
  RequestStateWhen._();

  static bool Function(S prev, S curr) changed<S, T>(RequestState<T> Function(S state) selector) => (prev, curr) => selector(curr).hasChanged(selector(prev));

  static bool Function(S prev, S curr) typeChanged<S, T>(RequestState<T> Function(S state) selector) => (prev, curr) => selector(curr).hasTypeChanged(selector(prev));

  static bool Function(S prev, S curr) success<S, T>(RequestState<T> Function(S state) selector) => (prev, curr) => selector(curr).becameSuccess(selector(prev));

  static bool Function(S prev, S curr) failure<S, T>(RequestState<T> Function(S state) selector) => (prev, curr) => selector(curr).becameFailure(selector(prev));

  static bool Function(S prev, S curr) loading<S, T>(RequestState<T> Function(S state) selector) => (prev, curr) => selector(curr).becameLoading(selector(prev));

  static bool Function(S prev, S curr) completed<S, T>(RequestState<T> Function(S state) selector) => (prev, curr) => selector(curr).completed(selector(prev));

  static bool Function(S prev, S curr) loadingToSuccess<S, T>(RequestState<T> Function(S state) selector) => (prev, curr) => selector(curr).loadingToSuccess(selector(prev));

  static bool Function(S prev, S curr) loadingToFailure<S, T>(RequestState<T> Function(S state) selector) => (prev, curr) => selector(curr).loadingToFailure(selector(prev));
}
