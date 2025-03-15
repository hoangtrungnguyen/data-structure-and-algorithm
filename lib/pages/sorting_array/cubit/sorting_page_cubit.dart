import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:data_structure_and_algorithm/pages/sorting_array/cubit/swap.dart';
import 'package:data_structure_and_algorithm/pages/sorting_array/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sorting_page_state.dart';

part 'sorting_page_event.dart';

part 'sorting_page_cubit.freezed.dart';

class SortingPageBloc extends Bloc<SortingPageEvent, SortingPageState> {
  SortingPageBloc() : super(SortingPageState.initial()) {
    on<GenerateArrayEvent>(_onGenerateArrayEvent);
    // on<StartSortingEvent>(_onStartSortingEvent);
    on<SelectAlgorithmEvent>(_onSelectAlgorithmEvent);
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
    // AlgorithmState algorithmState = AlgorithmState();
    // algorithmState = algorithmState.copyWith(
    //     array: List.generate(algorithmState.length, (_) {
    //   return Random().nextInt(algorithmState.maxValue);
    // }));
    final loaded = SortingPageState.loaded(
        type: TypeOfAlgorithm.bubble,
        originArray: List.generate(50, (_) {
          return Random().nextInt(100);
        }));

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

  // FutureOr<void> _onStartSortingEvent(
  //     StartSortingEvent event, Emitter<SortingPageState> emit) async {
  //   // if (state is! _PageLoaded) return;
  //   final algorithmState = state.whenOrNull(loaded: (_, __, algorithmState) {
  //     return algorithmState;
  //   });
  //   final type = state.whenOrNull(loaded: (type, __, ___) {
  //     return type;
  //   });
  //   if (algorithmState == null || type == null) {
  //     return;
  //   }
  //
  //   switch (type) {
  //     case TypeOfAlgorithm.bubble:
  //       await _bubbleSort(algorithmState, emit);
  //     case TypeOfAlgorithm.selection:
  //       await _selectionSort(algorithmState, emit);
  //     default:
  //       throw UnimplementedError("Unimplemented algorithm");
  //   }
  // }
  //
  // AlgorithmState _chooseIndexAndSwap(
  //     AlgorithmState algorithmState, List<int> list, int index) {
  //   list.swap(index, index + 1);
  //   final algoState = algorithmState;
  //   return algoState.copyWith(
  //     array: List.of(list),
  //     selectedIndex: index,
  //     selectedIndex2: index + 1,
  //   );
  // }
  //
  // Future _bubbleSort(
  //     AlgorithmState algorithmState, Emitter<SortingPageState> emit) async {
  //   List<int> list = List.of(algorithmState.array);
  //   for (int i = 0; i < list.length - 1; i++) {
  //     var swapped = false;
  //     for (int j = 0; j < list.length - 1; j++) {
  //       if (list[j].compareTo(list[j + 1]) > 0) {
  //         final newAlgoState = _chooseIndexAndSwap(algorithmState, list, j);
  //         emit(SortingPageState.loaded(
  //           type: TypeOfAlgorithm.bubble,
  //           status: AlgorithmStatusState.inProgress(),
  //           algorithmState: newAlgoState,
  //         ));
  //         await Future.delayed(const Duration(milliseconds: 300));
  //         emit(SortingPageState.loaded(
  //           type: TypeOfAlgorithm.bubble,
  //           status: AlgorithmStatusState.inProgress(),
  //           algorithmState:
  //               newAlgoState.copyWith(selectedIndex: j + 1, selectedIndex2: j),
  //         ));
  //         await Future.delayed(const Duration(milliseconds: 300));
  //         swapped = true;
  //       }
  //     }
  //     if (!swapped) return;
  //   }
  // }
  //
  // Future _selectionSort(
  //     AlgorithmState algorithmState, Emitter<SortingPageState> emit) async {
  //   List<int> list = List.of(algorithmState.array);
  //   for (int i = 0; i < list.length; i++) {
  //     int smallest = list[i];
  //     int smallestIndex = -1;
  //
  //     for (int j = i + 1; j < list.length; j++) {
  //       if (list[j] < smallest) {
  //         smallestIndex = j;
  //         smallest = list[j];
  //       }
  //     }
  //     if (smallestIndex != -1) {
  //       list.swap(smallestIndex, i);
  //     }
  //   }
  //
  //   emit(SortingPageState.loaded(
  //       type: TypeOfAlgorithm.selection,
  //       status: AlgorithmStatusState.inProgress(),
  //       algorithmState: algorithmState.copyWith(array: list)));
  // }

  FutureOr<void> _onSelectAlgorithmEvent(
      SelectAlgorithmEvent event, Emitter<SortingPageState> emit) async {
    if (state is! _PageLoaded) return;
    final loaded = state as _PageLoaded;
    emit(loaded.copyWith(type: event.type));
  }
}
