import 'package:flutter_bloc/flutter_bloc.dart';
import 'checkout_event.dart';
import 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutState(0)) {
    on<NextStep>((event, emit) {
      if (state.step < 2) {
        emit(CheckoutState(state.step + 1));
      }
    });

    on<PreviousStep>((event, emit) {
      if (state.step > 0) {
        emit(CheckoutState(state.step - 1));
      }
    });
  }
}