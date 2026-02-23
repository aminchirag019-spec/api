import 'package:api_learning/Bloc/DashboardBloc/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'checkout_event.dart';
import 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutState(0)) {
    on<NextStep>(_onNextStep);
    on<PreviousStep>(_onPreviousStep);
  }

  void _onNextStep(NextStep event,
      Emitter<CheckoutState> emit)async{
    if(state.step <2){
      emit(CheckoutState(state.step +1));
    }
  }

  void _onPreviousStep(PreviousStep event,Emitter<CheckoutState>emit){
    if(state.step >0){
      emit(CheckoutState(state.step -1));
    }
  }
}