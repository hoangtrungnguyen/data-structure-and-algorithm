import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:data_structure_and_algorithm/pages/sorting_array/cubit/swap.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sorting_page_state.dart';

part 'sorting_page_event.dart';

part 'sorting_page_cubit.freezed.dart';

class SortingPageCubit extends Bloc<SortingPageEvent, SortingPageState> {
  SortingPageCubit() : super(SortingPageState.initial()) {
    on<GenerateArrayEvent>(_onGenerateArrayEvent);
    on<StartSortingEvent>(_onStartSortingEvent);
  }

  @override
  void onChange(Change<SortingPageState> change) {
    super.onChange(change);
    print(change);
  }

  Future _onGenerateArrayEvent(
    GenerateArrayEvent event,
    Emitter<SortingPageState> emit,
  ) async {
    AlgorithmState algorithmState = AlgorithmState();
    algorithmState = algorithmState.copyWith(
        array: List.generate(algorithmState.length, (_) {
      return Random().nextInt(algorithmState.maxValue);
    }));
    final loaded = SortingPageState.loaded(
      status: AlgorithmStatusState.initial(),
      algorithmState: algorithmState,
    );

    emit(loaded);
  }

  //
  // Future bubbleSort() async {
  //   if (state is _Initial) return;
  //   final loaded = state as _Loaded;
  //   List<int> list = List.of(loaded.array);
  //
  //   for (int i = 0; i < list.length - 1; i++) {
  //     var swapped = false;
  //     for (int j = 0; j < list.length - 1; j++) {
  //       if (list[j].compareTo(list[j + 1]) > 0) {
  //         await Future.delayed(const Duration(milliseconds: 300));
  //         list.swap(j, j + 1);
  //         emit(loaded.copyWith(array: List.of(list)));
  //         swapped = true;
  //       }
  //     }
  //     if(!swapped) return;
  //   }
  // }

  FutureOr<void> _onStartSortingEvent(
      StartSortingEvent event, Emitter<SortingPageState> emit) async {
    // if (state is! _PageLoaded) return;
    final algorithmState = state.whenOrNull(loaded: (_, algorithmState) {
      return algorithmState;
    });
    if (algorithmState == null) {
      return;
    }
    List<int> list = List.of(algorithmState.array);
    for (int i = 0; i < list.length - 1; i++) {
      var swapped = false;
      for (int j = 0; j < list.length - 1; j++) {
        if (list[j].compareTo(list[j + 1]) > 0) {
          final newAlgoState = _chooseIndexAndSwap(algorithmState, list, j);
          emit(SortingPageState.loaded(
            status: AlgorithmStatusState.inProgress(),
            algorithmState: newAlgoState,
          ));
          await Future.delayed(const Duration(milliseconds: 300));
          emit(SortingPageState.loaded(
            status: AlgorithmStatusState.inProgress(),
            algorithmState:
                newAlgoState.copyWith(selectedIndex: j + 1, selectedIndex2: j),
          ));
          await Future.delayed(const Duration(milliseconds: 300));
          swapped = true;
        }
      }
      if (!swapped) return;
    }
  }

  AlgorithmState _chooseIndexAndSwap(
      AlgorithmState algorithmState, List<int> list, int index) {
    list.swap(index, index + 1);
    final algoState = algorithmState;
    return algoState.copyWith(
      array: List.of(list),
      selectedIndex: index,
      selectedIndex2: index + 1,
    );
  }
}
