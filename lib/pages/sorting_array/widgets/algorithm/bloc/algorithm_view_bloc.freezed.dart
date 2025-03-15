// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'algorithm_view_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AlgorithmViewEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() cancel,
    required TResult Function() finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? cancel,
    TResult? Function()? finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? cancel,
    TResult Function()? finished,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_Finished value) finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_Finished value)? finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_Finished value)? finished,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlgorithmViewEventCopyWith<$Res> {
  factory $AlgorithmViewEventCopyWith(
          AlgorithmViewEvent value, $Res Function(AlgorithmViewEvent) then) =
      _$AlgorithmViewEventCopyWithImpl<$Res, AlgorithmViewEvent>;
}

/// @nodoc
class _$AlgorithmViewEventCopyWithImpl<$Res, $Val extends AlgorithmViewEvent>
    implements $AlgorithmViewEventCopyWith<$Res> {
  _$AlgorithmViewEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlgorithmViewEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$AlgorithmViewEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AlgorithmViewEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'AlgorithmViewEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() cancel,
    required TResult Function() finished,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? cancel,
    TResult? Function()? finished,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? cancel,
    TResult Function()? finished,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_Finished value) finished,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_Finished value)? finished,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_Finished value)? finished,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements AlgorithmViewEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$CancelImplCopyWith<$Res> {
  factory _$$CancelImplCopyWith(
          _$CancelImpl value, $Res Function(_$CancelImpl) then) =
      __$$CancelImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CancelImplCopyWithImpl<$Res>
    extends _$AlgorithmViewEventCopyWithImpl<$Res, _$CancelImpl>
    implements _$$CancelImplCopyWith<$Res> {
  __$$CancelImplCopyWithImpl(
      _$CancelImpl _value, $Res Function(_$CancelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AlgorithmViewEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CancelImpl implements _Cancel {
  const _$CancelImpl();

  @override
  String toString() {
    return 'AlgorithmViewEvent.cancel()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CancelImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() cancel,
    required TResult Function() finished,
  }) {
    return cancel();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? cancel,
    TResult? Function()? finished,
  }) {
    return cancel?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? cancel,
    TResult Function()? finished,
    required TResult orElse(),
  }) {
    if (cancel != null) {
      return cancel();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_Finished value) finished,
  }) {
    return cancel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_Finished value)? finished,
  }) {
    return cancel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_Finished value)? finished,
    required TResult orElse(),
  }) {
    if (cancel != null) {
      return cancel(this);
    }
    return orElse();
  }
}

abstract class _Cancel implements AlgorithmViewEvent {
  const factory _Cancel() = _$CancelImpl;
}

/// @nodoc
abstract class _$$FinishedImplCopyWith<$Res> {
  factory _$$FinishedImplCopyWith(
          _$FinishedImpl value, $Res Function(_$FinishedImpl) then) =
      __$$FinishedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FinishedImplCopyWithImpl<$Res>
    extends _$AlgorithmViewEventCopyWithImpl<$Res, _$FinishedImpl>
    implements _$$FinishedImplCopyWith<$Res> {
  __$$FinishedImplCopyWithImpl(
      _$FinishedImpl _value, $Res Function(_$FinishedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AlgorithmViewEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FinishedImpl implements _Finished {
  const _$FinishedImpl();

  @override
  String toString() {
    return 'AlgorithmViewEvent.finished()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FinishedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() cancel,
    required TResult Function() finished,
  }) {
    return finished();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? cancel,
    TResult? Function()? finished,
  }) {
    return finished?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? cancel,
    TResult Function()? finished,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_Finished value) finished,
  }) {
    return finished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_Finished value)? finished,
  }) {
    return finished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_Finished value)? finished,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished(this);
    }
    return orElse();
  }
}

abstract class _Finished implements AlgorithmViewEvent {
  const factory _Finished() = _$FinishedImpl;
}

/// @nodoc
mixin _$AlgorithmViewState {
  AlgorithmStatusState get status => throw _privateConstructorUsedError;
  AlgorithmState get algorithmState => throw _privateConstructorUsedError;

  /// Create a copy of AlgorithmViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlgorithmViewStateCopyWith<AlgorithmViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlgorithmViewStateCopyWith<$Res> {
  factory $AlgorithmViewStateCopyWith(
          AlgorithmViewState value, $Res Function(AlgorithmViewState) then) =
      _$AlgorithmViewStateCopyWithImpl<$Res, AlgorithmViewState>;
  @useResult
  $Res call({AlgorithmStatusState status, AlgorithmState algorithmState});

  $AlgorithmStatusStateCopyWith<$Res> get status;
  $AlgorithmStateCopyWith<$Res> get algorithmState;
}

/// @nodoc
class _$AlgorithmViewStateCopyWithImpl<$Res, $Val extends AlgorithmViewState>
    implements $AlgorithmViewStateCopyWith<$Res> {
  _$AlgorithmViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlgorithmViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? algorithmState = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AlgorithmStatusState,
      algorithmState: null == algorithmState
          ? _value.algorithmState
          : algorithmState // ignore: cast_nullable_to_non_nullable
              as AlgorithmState,
    ) as $Val);
  }

  /// Create a copy of AlgorithmViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AlgorithmStatusStateCopyWith<$Res> get status {
    return $AlgorithmStatusStateCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }

  /// Create a copy of AlgorithmViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AlgorithmStateCopyWith<$Res> get algorithmState {
    return $AlgorithmStateCopyWith<$Res>(_value.algorithmState, (value) {
      return _then(_value.copyWith(algorithmState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AlgorithmViewStateImplCopyWith<$Res>
    implements $AlgorithmViewStateCopyWith<$Res> {
  factory _$$AlgorithmViewStateImplCopyWith(_$AlgorithmViewStateImpl value,
          $Res Function(_$AlgorithmViewStateImpl) then) =
      __$$AlgorithmViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AlgorithmStatusState status, AlgorithmState algorithmState});

  @override
  $AlgorithmStatusStateCopyWith<$Res> get status;
  @override
  $AlgorithmStateCopyWith<$Res> get algorithmState;
}

/// @nodoc
class __$$AlgorithmViewStateImplCopyWithImpl<$Res>
    extends _$AlgorithmViewStateCopyWithImpl<$Res, _$AlgorithmViewStateImpl>
    implements _$$AlgorithmViewStateImplCopyWith<$Res> {
  __$$AlgorithmViewStateImplCopyWithImpl(_$AlgorithmViewStateImpl _value,
      $Res Function(_$AlgorithmViewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AlgorithmViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? algorithmState = null,
  }) {
    return _then(_$AlgorithmViewStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AlgorithmStatusState,
      algorithmState: null == algorithmState
          ? _value.algorithmState
          : algorithmState // ignore: cast_nullable_to_non_nullable
              as AlgorithmState,
    ));
  }
}

/// @nodoc

class _$AlgorithmViewStateImpl implements _AlgorithmViewState {
  const _$AlgorithmViewStateImpl(
      {this.status = const AlgorithmStatusState.initial(),
      required this.algorithmState});

  @override
  @JsonKey()
  final AlgorithmStatusState status;
  @override
  final AlgorithmState algorithmState;

  @override
  String toString() {
    return 'AlgorithmViewState(status: $status, algorithmState: $algorithmState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlgorithmViewStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.algorithmState, algorithmState) ||
                other.algorithmState == algorithmState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, algorithmState);

  /// Create a copy of AlgorithmViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlgorithmViewStateImplCopyWith<_$AlgorithmViewStateImpl> get copyWith =>
      __$$AlgorithmViewStateImplCopyWithImpl<_$AlgorithmViewStateImpl>(
          this, _$identity);
}

abstract class _AlgorithmViewState implements AlgorithmViewState {
  const factory _AlgorithmViewState(
      {final AlgorithmStatusState status,
      required final AlgorithmState algorithmState}) = _$AlgorithmViewStateImpl;

  @override
  AlgorithmStatusState get status;
  @override
  AlgorithmState get algorithmState;

  /// Create a copy of AlgorithmViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlgorithmViewStateImplCopyWith<_$AlgorithmViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AlgorithmStatusState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function() finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function()? finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function()? finished,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AlgorithmInitial value) initial,
    required TResult Function(_AlgorithmInProgress value) inProgress,
    required TResult Function(_AlgorithmFinished value) finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AlgorithmInitial value)? initial,
    TResult? Function(_AlgorithmInProgress value)? inProgress,
    TResult? Function(_AlgorithmFinished value)? finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AlgorithmInitial value)? initial,
    TResult Function(_AlgorithmInProgress value)? inProgress,
    TResult Function(_AlgorithmFinished value)? finished,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlgorithmStatusStateCopyWith<$Res> {
  factory $AlgorithmStatusStateCopyWith(AlgorithmStatusState value,
          $Res Function(AlgorithmStatusState) then) =
      _$AlgorithmStatusStateCopyWithImpl<$Res, AlgorithmStatusState>;
}

/// @nodoc
class _$AlgorithmStatusStateCopyWithImpl<$Res,
        $Val extends AlgorithmStatusState>
    implements $AlgorithmStatusStateCopyWith<$Res> {
  _$AlgorithmStatusStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlgorithmStatusState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AlgorithmInitialImplCopyWith<$Res> {
  factory _$$AlgorithmInitialImplCopyWith(_$AlgorithmInitialImpl value,
          $Res Function(_$AlgorithmInitialImpl) then) =
      __$$AlgorithmInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AlgorithmInitialImplCopyWithImpl<$Res>
    extends _$AlgorithmStatusStateCopyWithImpl<$Res, _$AlgorithmInitialImpl>
    implements _$$AlgorithmInitialImplCopyWith<$Res> {
  __$$AlgorithmInitialImplCopyWithImpl(_$AlgorithmInitialImpl _value,
      $Res Function(_$AlgorithmInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AlgorithmStatusState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AlgorithmInitialImpl extends _AlgorithmInitial {
  const _$AlgorithmInitialImpl() : super._();

  @override
  String toString() {
    return 'AlgorithmStatusState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AlgorithmInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function() finished,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function()? finished,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function()? finished,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AlgorithmInitial value) initial,
    required TResult Function(_AlgorithmInProgress value) inProgress,
    required TResult Function(_AlgorithmFinished value) finished,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AlgorithmInitial value)? initial,
    TResult? Function(_AlgorithmInProgress value)? inProgress,
    TResult? Function(_AlgorithmFinished value)? finished,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AlgorithmInitial value)? initial,
    TResult Function(_AlgorithmInProgress value)? inProgress,
    TResult Function(_AlgorithmFinished value)? finished,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _AlgorithmInitial extends AlgorithmStatusState {
  const factory _AlgorithmInitial() = _$AlgorithmInitialImpl;
  const _AlgorithmInitial._() : super._();
}

/// @nodoc
abstract class _$$AlgorithmInProgressImplCopyWith<$Res> {
  factory _$$AlgorithmInProgressImplCopyWith(_$AlgorithmInProgressImpl value,
          $Res Function(_$AlgorithmInProgressImpl) then) =
      __$$AlgorithmInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AlgorithmInProgressImplCopyWithImpl<$Res>
    extends _$AlgorithmStatusStateCopyWithImpl<$Res, _$AlgorithmInProgressImpl>
    implements _$$AlgorithmInProgressImplCopyWith<$Res> {
  __$$AlgorithmInProgressImplCopyWithImpl(_$AlgorithmInProgressImpl _value,
      $Res Function(_$AlgorithmInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of AlgorithmStatusState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AlgorithmInProgressImpl extends _AlgorithmInProgress {
  _$AlgorithmInProgressImpl() : super._();

  @override
  String toString() {
    return 'AlgorithmStatusState.inProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlgorithmInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function() finished,
  }) {
    return inProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function()? finished,
  }) {
    return inProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function()? finished,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AlgorithmInitial value) initial,
    required TResult Function(_AlgorithmInProgress value) inProgress,
    required TResult Function(_AlgorithmFinished value) finished,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AlgorithmInitial value)? initial,
    TResult? Function(_AlgorithmInProgress value)? inProgress,
    TResult? Function(_AlgorithmFinished value)? finished,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AlgorithmInitial value)? initial,
    TResult Function(_AlgorithmInProgress value)? inProgress,
    TResult Function(_AlgorithmFinished value)? finished,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class _AlgorithmInProgress extends AlgorithmStatusState {
  factory _AlgorithmInProgress() = _$AlgorithmInProgressImpl;
  _AlgorithmInProgress._() : super._();
}

/// @nodoc
abstract class _$$AlgorithmFinishedImplCopyWith<$Res> {
  factory _$$AlgorithmFinishedImplCopyWith(_$AlgorithmFinishedImpl value,
          $Res Function(_$AlgorithmFinishedImpl) then) =
      __$$AlgorithmFinishedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AlgorithmFinishedImplCopyWithImpl<$Res>
    extends _$AlgorithmStatusStateCopyWithImpl<$Res, _$AlgorithmFinishedImpl>
    implements _$$AlgorithmFinishedImplCopyWith<$Res> {
  __$$AlgorithmFinishedImplCopyWithImpl(_$AlgorithmFinishedImpl _value,
      $Res Function(_$AlgorithmFinishedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AlgorithmStatusState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AlgorithmFinishedImpl extends _AlgorithmFinished {
  _$AlgorithmFinishedImpl() : super._();

  @override
  String toString() {
    return 'AlgorithmStatusState.finished()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AlgorithmFinishedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function() finished,
  }) {
    return finished();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function()? finished,
  }) {
    return finished?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function()? finished,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AlgorithmInitial value) initial,
    required TResult Function(_AlgorithmInProgress value) inProgress,
    required TResult Function(_AlgorithmFinished value) finished,
  }) {
    return finished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AlgorithmInitial value)? initial,
    TResult? Function(_AlgorithmInProgress value)? inProgress,
    TResult? Function(_AlgorithmFinished value)? finished,
  }) {
    return finished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AlgorithmInitial value)? initial,
    TResult Function(_AlgorithmInProgress value)? inProgress,
    TResult Function(_AlgorithmFinished value)? finished,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished(this);
    }
    return orElse();
  }
}

abstract class _AlgorithmFinished extends AlgorithmStatusState {
  factory _AlgorithmFinished() = _$AlgorithmFinishedImpl;
  _AlgorithmFinished._() : super._();
}

/// @nodoc
mixin _$AlgorithmState {
  int get length => throw _privateConstructorUsedError;
  int get maxValue => throw _privateConstructorUsedError;
  List<int> get array => throw _privateConstructorUsedError;
  int get selectedIndex => throw _privateConstructorUsedError;
  int get selectedIndex2 => throw _privateConstructorUsedError;

  /// Create a copy of AlgorithmState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlgorithmStateCopyWith<AlgorithmState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlgorithmStateCopyWith<$Res> {
  factory $AlgorithmStateCopyWith(
          AlgorithmState value, $Res Function(AlgorithmState) then) =
      _$AlgorithmStateCopyWithImpl<$Res, AlgorithmState>;
  @useResult
  $Res call(
      {int length,
      int maxValue,
      List<int> array,
      int selectedIndex,
      int selectedIndex2});
}

/// @nodoc
class _$AlgorithmStateCopyWithImpl<$Res, $Val extends AlgorithmState>
    implements $AlgorithmStateCopyWith<$Res> {
  _$AlgorithmStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlgorithmState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? length = null,
    Object? maxValue = null,
    Object? array = null,
    Object? selectedIndex = null,
    Object? selectedIndex2 = null,
  }) {
    return _then(_value.copyWith(
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
      maxValue: null == maxValue
          ? _value.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
              as int,
      array: null == array
          ? _value.array
          : array // ignore: cast_nullable_to_non_nullable
              as List<int>,
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedIndex2: null == selectedIndex2
          ? _value.selectedIndex2
          : selectedIndex2 // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlgorithmStateImplCopyWith<$Res>
    implements $AlgorithmStateCopyWith<$Res> {
  factory _$$AlgorithmStateImplCopyWith(_$AlgorithmStateImpl value,
          $Res Function(_$AlgorithmStateImpl) then) =
      __$$AlgorithmStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int length,
      int maxValue,
      List<int> array,
      int selectedIndex,
      int selectedIndex2});
}

/// @nodoc
class __$$AlgorithmStateImplCopyWithImpl<$Res>
    extends _$AlgorithmStateCopyWithImpl<$Res, _$AlgorithmStateImpl>
    implements _$$AlgorithmStateImplCopyWith<$Res> {
  __$$AlgorithmStateImplCopyWithImpl(
      _$AlgorithmStateImpl _value, $Res Function(_$AlgorithmStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AlgorithmState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? length = null,
    Object? maxValue = null,
    Object? array = null,
    Object? selectedIndex = null,
    Object? selectedIndex2 = null,
  }) {
    return _then(_$AlgorithmStateImpl(
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
      maxValue: null == maxValue
          ? _value.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
              as int,
      array: null == array
          ? _value._array
          : array // ignore: cast_nullable_to_non_nullable
              as List<int>,
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedIndex2: null == selectedIndex2
          ? _value.selectedIndex2
          : selectedIndex2 // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AlgorithmStateImpl implements _AlgorithmState {
  const _$AlgorithmStateImpl(
      {this.length = 10,
      this.maxValue = 100,
      final List<int> array = const [],
      this.selectedIndex = 0,
      this.selectedIndex2 = 0})
      : _array = array;

  @override
  @JsonKey()
  final int length;
  @override
  @JsonKey()
  final int maxValue;
  final List<int> _array;
  @override
  @JsonKey()
  List<int> get array {
    if (_array is EqualUnmodifiableListView) return _array;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_array);
  }

  @override
  @JsonKey()
  final int selectedIndex;
  @override
  @JsonKey()
  final int selectedIndex2;

  @override
  String toString() {
    return 'AlgorithmState(length: $length, maxValue: $maxValue, array: $array, selectedIndex: $selectedIndex, selectedIndex2: $selectedIndex2)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlgorithmStateImpl &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.maxValue, maxValue) ||
                other.maxValue == maxValue) &&
            const DeepCollectionEquality().equals(other._array, _array) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.selectedIndex2, selectedIndex2) ||
                other.selectedIndex2 == selectedIndex2));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      length,
      maxValue,
      const DeepCollectionEquality().hash(_array),
      selectedIndex,
      selectedIndex2);

  /// Create a copy of AlgorithmState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlgorithmStateImplCopyWith<_$AlgorithmStateImpl> get copyWith =>
      __$$AlgorithmStateImplCopyWithImpl<_$AlgorithmStateImpl>(
          this, _$identity);
}

abstract class _AlgorithmState implements AlgorithmState {
  const factory _AlgorithmState(
      {final int length,
      final int maxValue,
      final List<int> array,
      final int selectedIndex,
      final int selectedIndex2}) = _$AlgorithmStateImpl;

  @override
  int get length;
  @override
  int get maxValue;
  @override
  List<int> get array;
  @override
  int get selectedIndex;
  @override
  int get selectedIndex2;

  /// Create a copy of AlgorithmState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlgorithmStateImplCopyWith<_$AlgorithmStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
