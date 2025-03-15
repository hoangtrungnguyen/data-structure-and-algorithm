import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:data_structure_and_algorithm/pages/sorting_array/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'algorithm_view_event.dart';

part 'algorithm_view_state.dart';

part 'algorithm_view_bloc.freezed.dart';

class AlgorithmViewBloc extends Bloc<AlgorithmViewEvent, AlgorithmViewState> {
  final TypeOfAlgorithm type;
  final List<int> originArray;

  AlgorithmViewBloc(this.type, this.originArray)
      : super(AlgorithmViewState(
          algorithmState:
              AlgorithmState(array: originArray, length: originArray.length),
        )) {

    on<_Started>((event, emit) async {
      await _bubbleSort(state.algorithmState, emit);
    });
  }

  Future _bubbleSort(
      AlgorithmState algorithmState, Emitter<AlgorithmViewState> emit) async {
    List<int> list = List.of(algorithmState.array);
    for (int i = 0; i < list.length - 1; i++) {
      var swapped = false;
      for (int j = 0; j < list.length - 1; j++) {
        if (list[j].compareTo(list[j + 1]) > 0) {
          final newAlgoState = _chooseIndexAndSwap(algorithmState, list, j);
          emit(state.copyWith(
            algorithmState: newAlgoState,
          ));
          await Future.delayed(const Duration(milliseconds: 15));
          // emit(SortingPageState.loaded(
          //   type: TypeOfAlgorithm.bubble,
          //   status: AlgorithmStatusState.inProgress(),
          //   algorithmState:
          //       newAlgoState.copyWith(selectedIndex: j + 1, selectedIndex2: j),
          // ));
          emit(state.copyWith(
            algorithmState: state.algorithmState.copyWith(
              selectedIndex: j + 1,
              selectedIndex2: j,
            ),
          ));
          await Future.delayed(const Duration(milliseconds: 15));
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
