import 'package:json_annotation/json_annotation.dart';

part 'history_state.g.dart';

@JsonSerializable()
class HistoryState {
  @JsonKey(name: 'id')
  int? id;
}