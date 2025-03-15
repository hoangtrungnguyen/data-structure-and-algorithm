part of 'sorting_page_cubit.dart';

@freezed
class SortingPageState with _$SortingPageState {
  factory SortingPageState.initial() = _PageInitial;
  factory SortingPageState.loading() = _PageLoading;
  factory SortingPageState.loaded({
    required TypeOfAlgorithm type,
    @Default([]) List<int> originArray,
  }) = _PageLoaded;
}

