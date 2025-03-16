import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:data_structure_and_algorithm/pages/sorting_array/utils.dart';
import 'package:flutter/animation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'algorithm_view_event.dart';

part 'algorithm_view_state.dart';

part 'algorithm_view_bloc.freezed.dart';

class AlgorithmViewBloc extends Bloc<AlgorithmViewEvent, AlgorithmViewState> {
  final TypeOfAlgorithm type;
  final List<int> array;

  late TickerProvider vsync;

  AlgorithmViewBloc(this.type, this.array)
      : super(AlgorithmViewState.initial()) {
    // AlgorithmState(array: originArray, length: originArray.length),

    on<_Initialized>((event, emit) async {
      final initialArray = array;
      final animationControllers = <int, AnimationController>{};
      vsync = event.vsync;

      for (int i = 0; i < initialArray.length; i++) {
        animationControllers[i] = AnimationController(
          duration: const Duration(milliseconds: 300),
          vsync: vsync, // Use the passed TickerProvider
        );
      }

      emit(state.copyWith(
          algorithmState: AlgorithmState(array: array, length: array.length),
          animationControllers: animationControllers));
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

    on<_Swapped>((event, emit) async {
      final currentState = state;
      final array =
      List<int>.from(currentState.algorithmState.array); // Create a copy
      final temp = array[event.index1];
      array[event.index1] = array[event.index2];
      array[event.index2] = temp;

      final animationControllers =
      Map<int, AnimationController>.from(currentState.animationControllers);
      final animations =
      Map<int, Animation<double>>.from(currentState.animations);

      // Initialize AnimationControllers if they don't exist
      if (!animationControllers.containsKey(event.index1)) {
        animationControllers[event.index1] = AnimationController(
          duration: const Duration(milliseconds: 300),
          vsync: event.vsync, // Use a TickerProvider
        );
      }
      if (!animationControllers.containsKey(event.index2)) {
        animationControllers[event.index2] = AnimationController(
          duration: const Duration(milliseconds: 300),
          vsync: event.vsync,
        );
      }

      // Create Tweens for the animations
      animations[event.index1] = Tween<double>(
          begin: event.index1.toDouble(), end: event.index2.toDouble())
          .animate(animationControllers[event.index1]!);
      animations[event.index2] = Tween<double>(
          begin: event.index2.toDouble(), end: event.index1.toDouble())
          .animate(animationControllers[event.index2]!);

      // Start Animations

      // Wait for the animation to complete
      await Future.wait([
        animationControllers[event.index1]!.forward(from: 0),
        animationControllers[event.index2]!.forward(from: 0),

      ]);
      emit(currentState.copyWith(
          animationControllers: animationControllers,
          animations: animations,
          algorithmState: currentState.algorithmState.copyWith(array: array)));


      // Clean up animations
      animationControllers[event.index1]!.reset();
      animationControllers[event.index2]!.reset();

      emit(currentState.copyWith(
        animationControllers: animationControllers,
        animations: animations,
      ));
    });
  }

  Future _bubbleSort(AlgorithmState algorithmState,
      Emitter<AlgorithmViewState> emit) async {
    AlgorithmState chooseIndexAndSwap(AlgorithmState algorithmState,
        List<int> list, int index) {
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
          chooseIndexAndSwap(algorithmState, list, j);
          // list.swap(j, j + 1);
          // await swap(emit, j + 1, j, list);
          await Future.delayed(const Duration(seconds: 500));
          // emit(SortingPageState.loaded(
          //   type: TypeOfAlgorithm.bubble,
          //   status: AlgorithmStatusState.inProgress(),
          //   algorithmState:
          //       newAlgoState.copyWith(selectedIndex: j + 1, selectedIndex2: j),
          // ));
          swapped = true;
        }
      }
      if (!swapped) return;
    }
    emit(state.copyWith(
      status: AlgorithmStatusState.finished(),
      algorithmState: state.algorithmState.copyWith(array: List.of(list)),
    ));
  }

  Future _selectionSort(AlgorithmState algorithmState,
      Emitter<AlgorithmViewState> emit) async {
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

  Future _insertionSort(AlgorithmState algorithmState,
      Emitter<AlgorithmViewState> emit) async {
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

  @override
  Future<void> close() {
    for (final controller in state.animationControllers.values) {
      controller.dispose();
    }
    return super.close();
  }

  Future swap(Emitter<AlgorithmViewState> emit, int index1, int index2,
      List<int> array) async {
    final currentState = state;

    final temp = array[index1];
    array[index1] = array[index2];
    array[index2] = temp;

    final animationControllers =
    Map<int, AnimationController>.from(currentState.animationControllers);
    final animations =
    Map<int, Animation<double>>.from(currentState.animations);

    // Initialize AnimationControllers if they don't exist
    if (!animationControllers.containsKey(index1)) {
      animationControllers[index1] = AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: vsync, // Use a TickerProvider
      );
    }
    if (!animationControllers.containsKey(index2)) {
      animationControllers[index2] = AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: vsync,
      );
    }

    // Create Tweens for the animations
    animations[index1] = Tween<double>(
        begin: index1.toDouble(), end: index2.toDouble())
        .animate(animationControllers[index1]!);
    animations[index2] = Tween<double>(
        begin: index2.toDouble(), end: index1.toDouble())
        .animate(animationControllers[index2]!);

    // Start Animations

    emit(currentState.copyWith(
        animationControllers: animationControllers,
        animations: animations,
        algorithmState: currentState.algorithmState.copyWith(array: array)));

    // Wait for the animation to complete
    await Future.wait([
      animationControllers[index1]!.forward(from: 0),
      animationControllers[index2]!.forward(from: 0),
    ]);

    // Clean up animations
    animationControllers[index1]!.reset();
    animationControllers[index2]!.reset();

    emit(currentState.copyWith(
      animationControllers: animationControllers,
      animations: animations,
    ));
  }
}
