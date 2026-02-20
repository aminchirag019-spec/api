import 'package:api_learning/router/router_class.dart';
import 'package:api_learning/screens/paymentScreens/payment_checkout_screen.dart';
import 'package:api_learning/screens/paymentScreens/shipping_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../Bloc/checkoutBloc/checkout_bloc.dart';
import '../../Bloc/checkoutBloc/checkout_event.dart';
import '../../Bloc/checkoutBloc/checkout_state.dart';
import 'order_completed_screen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SizedBox(
              height: 54,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2B2B2B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  if (state.step < 2) {
                    context.read<CheckoutBloc>().add(NextStep());
                  } else {
                    context.go(RouterName.dashboardScreen.path);
                  }
                },
                child: Text(
                  state.step == 0
                      ? "Continue to payment"
                      : state.step == 1
                      ? "Place my order"
                      : "Continue shopping",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          body: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  SizedBox(height: 14),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        CircleBackButton(
                          onTap: () {
                            if(state.step <1){
                              context.go(RouterName.dashboardScreen.path);
                            }
                            else {
                              context.read<CheckoutBloc>().add(PreviousStep());
                            }
                              },
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Center(
                            child: Text(
                              "Check out",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 40),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  stepIndicator(state.step),
                  SizedBox(height: 16),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: state.step == 0
                          ? ShippingScreen()
                          : state.step == 1
                          ? paymentStep(context)
                          : orderCompletedStep(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  Widget stepIndicator(int step) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.location_on, color: step >= 0 ? Colors.black : Colors.grey),
          Icon(Icons.credit_card, color: step >= 1 ? Colors.black : Colors.grey),
          Icon(Icons.check_circle, color: step >= 2 ? Colors.black : Colors.grey),
        ],
      ),
    );
  }
}
