import 'package:json_annotation/json_annotation.dart';

part 'payment_state.g.dart';

@JsonSerializable()
class PaymentState {
  @JsonKey(name: 'id')
  int? id;
}