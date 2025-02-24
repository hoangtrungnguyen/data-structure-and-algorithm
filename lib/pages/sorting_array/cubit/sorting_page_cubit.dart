import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:data_structure_and_algorithm/pages/sorting_array/cubit/swap.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sorting_page_state.dart';

part 'sorting_page_event.dart';

part 'sorting_page_cubit.freezed.dart';

class SortingPageCubit extends Bloc<SortingPageEvent, SortingPageState> {
  SortingPageCubit() : super(SortingPageState.initial()) {
    on<GenerateArrayEvent>(_onGenerateArrayEvent);
    on<StartSortingEvent>(_onStartSortingEvent);
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
    state.whenOrNull(loaded: (_, algorithmState) async {
      List<int> list = List.of(algorithmState.array);
      for (int i = 0; i < list.length - 1; i++) {
        var swapped = false;
        for (int j = 0; j < list.length - 1; j++) {
          if (list[j].compareTo(list[j + 1]) > 0) {
            list.swap(j, j + 1);
            await Future.delayed(const Duration(milliseconds: 300)).whenComplete((){
              emit(SortingPageState.loaded(
                  status: AlgorithmStatusState.inProgress(),
                  algorithmState: algorithmState.copyWith(
                      array: List.of(list)
                  )));
            });
            swapped = true;
          }
        }
        if (!swapped) return;
      }
    });
  }
}
