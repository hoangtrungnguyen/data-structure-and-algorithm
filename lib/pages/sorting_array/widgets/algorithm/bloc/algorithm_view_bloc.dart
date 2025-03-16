import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:data_structure_and_algorithm/pages/sorting_array/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'algorithm_view_event.dart';

part 'algorithm_view_state.dart';

part 'algorithm_view_bloc.freezed.dart';

class AlgorithmViewBloc extends Bloc<AlgorithmViewEvent, AlgorithmViewState> {
  final TypeOfAlgorithm type;
  final List<int> array;

  AlgorithmViewBloc(this.type, this.array)
      : super(AlgorithmViewState.initial()) {
    on<_Initialized>((event, emit) async {
      emit(state.copyWith(
        algorithmState: AlgorithmState(array: array, length: array.length),
      ));
    });

    on<_Started>((event, emit) async {
      switch (type) {
        case TypeOfAlgorithm.bubble:
          await _bubbleSort(state.algorithmState, emit);
        case TypeOfAlgorithm.selection:
          await _selectionSort(state.algorithmState, emit);
        case TypeOfAlgorithm.insertion:
          await _insertionSort(state.algorithmState, emit);
      }
    });
  }

  Future _bubbleSort(
      AlgorithmState algorithmState, Emitter<AlgorithmViewState> emit) async {
    AlgorithmState chooseIndexAndSwap(
        AlgorithmState algorithmState, List<int> list, int index) {
      list.swap(index, index + 1);
      final algoState = algorithmState;
      return algoState.copyWith(
        array: List.of(list),
        selectedIndex: index,
        selectedIndex2: index + 1,
      );
    }

    List<int> list = List.of(algorithmState.array);
    for (int i = 0; i < list.length - 1; i++) {
      var swapped = false;
      for (int j = 0; j < list.length - 1; j++) {
        if (list[j].compareTo(list[j + 1]) > 0) {
          final newState = chooseIndexAndSwap(algorithmState, list, j);
          emit(state.copyWith(
            algorithmState: newState
          ));
          await Future.delayed(const Duration(milliseconds: 15));
          swapped = true;
        }
      }
      if (!swapped) break;
    }
    emit(state.copyWith(
      status: AlgorithmStatusState.finished(),
      algorithmState: state.algorithmState.copyWith(array: List.of(list)),
    ));
  }

  Future _selectionSort(
      AlgorithmState algorithmState, Emitter<AlgorithmViewState> emit) async {
    List<int> list = List.of(algorithmState.array);

    for (int i = 0; i < list.length; i++) {
      int smallest = list[i];
      int smallestIndex = -1;
      await Future.delayed(const Duration(milliseconds: 15));

      emit(state.copyWith(
        algorithmState: state.algorithmState.copyWith(
          selectedIndex: i,
        ),
      ));

      for (int j = i + 1; j < list.length; j++) {
        emit(state.copyWith(
          algorithmState: state.algorithmState.copyWith(
            selectedIndex2: j,
          ),
        ));
        await Future.delayed(const Duration(
          milliseconds: 15,
        ));

        if (list[j] < smallest) {
          smallestIndex = j;
          smallest = list[j];
        }
      }
      if (smallestIndex != -1) {
        list.swap(smallestIndex, i);
      }

      emit(state.copyWith(
        algorithmState: state.algorithmState.copyWith(
          selectedIndex: i,
          array: List.of(list),
        ),
      ));
      await Future.delayed(const Duration(
        milliseconds: 15,
      ));
    }

    emit(state.copyWith(
      status: AlgorithmStatusState.finished(),
      algorithmState: state.algorithmState.copyWith(
        array: List.of(list),
      ),
    ));
  }

  Future _insertionSort(
      AlgorithmState algorithmState, Emitter<AlgorithmViewState> emit) async {
    List<int> list = List.of(algorithmState.array);
    for (int i = 1; i < list.length; i++) {
      for (int j = i; j > 0; j--) {
        if (list[j - 1] > list[j]) {
          list.swap(j, j - 1);
          emit(state.copyWith(
            algorithmState: state.algorithmState.copyWith(
              array: List.of(list),
              selectedIndex: j,
              selectedIndex2: j - 1,
            ),
          ));
          await Future.delayed(const Duration(milliseconds: 30));
        }
      }
    }

    emit(state.copyWith(
      status: AlgorithmStatusState.finished(),
      algorithmState: state.algorithmState.copyWith(
        array: List.of(list),
      ),
    ));
  }

}
