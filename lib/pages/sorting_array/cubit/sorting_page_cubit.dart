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
    late final TypeOfAlgorithm type;
    if (state is! _PageLoaded) {
      type = TypeOfAlgorithm.bubble;
    } else {
      type = (state as _PageLoaded).type;
    }
    final loaded = SortingPageState.loaded(
        type: type,
        originArray: List.generate(50, (_) {
          return Random().nextInt(100);
        }));

    emit(loaded);
  }

  FutureOr<void> _onSelectAlgorithmEvent(
      SelectAlgorithmEvent event, Emitter<SortingPageState> emit) async {
    if (state is! _PageLoaded) return;
    final loaded = state as _PageLoaded;
    emit(loaded.copyWith(
      type: event.type,
    ));
  }
}
