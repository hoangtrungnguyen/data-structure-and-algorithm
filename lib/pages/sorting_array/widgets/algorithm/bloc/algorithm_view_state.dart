part of 'algorithm_view_bloc.dart';

@freezed
class AlgorithmViewState with _$AlgorithmViewState {
  const factory AlgorithmViewState({
    @Default(AlgorithmStatusState.initial()) AlgorithmStatusState status,
    required AlgorithmState algorithmState,
  }) = _AlgorithmViewState;
}

@freezed
class AlgorithmStatusState with _$AlgorithmStatusState {
  const factory AlgorithmStatusState.initial() = _AlgorithmInitial;

  factory AlgorithmStatusState.inProgress() = _AlgorithmInProgress;

  factory AlgorithmStatusState.finished() = _AlgorithmFinished;

  const AlgorithmStatusState._();
}

@freezed
class AlgorithmState with _$AlgorithmState {
  factory AlgorithmState({
    @Default(10) int length,
    @Default(100) int maxValue,
    @Default([]) List<int> array,
    @Default(0) int selectedIndex,
    @Default(0) int selectedIndex2,
  }) = _AlgorithmState;

  factory AlgorithmState.initial() {
    return AlgorithmState();
  }

  const AlgorithmState._();
}
