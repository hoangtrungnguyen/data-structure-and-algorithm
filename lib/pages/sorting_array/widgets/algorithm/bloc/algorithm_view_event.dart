part of 'algorithm_view_bloc.dart';

@freezed
class AlgorithmViewEvent with _$AlgorithmViewEvent {
  const factory AlgorithmViewEvent.started() = _Started;
  const factory AlgorithmViewEvent.cancel() = _Cancel;
  const factory AlgorithmViewEvent.finished() = _Finished;
}
