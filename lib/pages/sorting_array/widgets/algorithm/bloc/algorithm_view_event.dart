part of 'algorithm_view_bloc.dart';

@freezed
class AlgorithmViewEvent with _$AlgorithmViewEvent {

  const factory AlgorithmViewEvent.initialized({
    required TickerProvider vsync,
  }) = _Initialized;

  const factory AlgorithmViewEvent.started() = _Started;

  const factory AlgorithmViewEvent.swapped({
    required int index1,
    required int index2,
    required TickerProvider vsync,
  }) = _Swapped;

  const factory AlgorithmViewEvent.cancel() = _Cancel;

  const factory AlgorithmViewEvent.finished() = _Finished;
}
