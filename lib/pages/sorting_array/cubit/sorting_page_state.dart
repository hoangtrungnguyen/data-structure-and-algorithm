part of 'sorting_page_cubit.dart';

@freezed
class SortingPageState with _$SortingPageState {
  factory SortingPageState.initial() = _PageInitial;
  factory SortingPageState.loading() = _PageLoading;
  factory SortingPageState.loaded({
    required AlgorithmStatusState status,
    required AlgorithmState algorithmState,
  }) = _PageLoaded;
}

@freezed
class AlgorithmStatusState with _$AlgorithmStatusState {
  factory AlgorithmStatusState.initial() = _AlgorithmInitial;

  factory AlgorithmStatusState.inProgress() = _AlgorithmInProgress;

  factory AlgorithmStatusState.finished() = _AlgorithmFinished;

  AlgorithmStatusState._();
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
}
