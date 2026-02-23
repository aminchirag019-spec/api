
import 'package:equatable/equatable.dart';

class CheckoutState extends Equatable{
  final int step;
  CheckoutState(this.step);

  CheckoutState copyWith({
    int?step
}) {
    return CheckoutState(
       step ?? this.step
    );
  }
  @override
  List<Object?> get props => [step];
}