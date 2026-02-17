import 'package:api_learning/Bloc/DashboardBloc/dashboard_bloc.dart';
import 'package:api_learning/Bloc/DashboardBloc/dashboard_event.dart';
import 'package:api_learning/Bloc/DashboardBloc/dashboard_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CheckoutShippingScreen extends StatefulWidget {
  const CheckoutShippingScreen({super.key});

  @override
  State<CheckoutShippingScreen> createState() => _CheckoutShippingScreenState();
}

class _CheckoutShippingScreenState extends State<CheckoutShippingScreen> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _country = TextEditingController();
  final _street = TextEditingController();
  final _city = TextEditingController();
  final _state = TextEditingController();
  final _zip = TextEditingController();
  final _phone = TextEditingController();
  final _coupon = TextEditingController();

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _country.dispose();
    _street.dispose();
    _city.dispose();
    _state.dispose();
    _zip.dispose();
    _phone.dispose();
    _coupon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go('/Dashboard');
        return false;
      },
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.fromLTRB(18, 10, 18, 18),
              child: SizedBox(
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2B2B2B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Continue to payment",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 14,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Row
                    Row(
                      children: [
                        _CircleBackButton(onTap: () => context.pop()),
                        SizedBox(width: 12),
                        Expanded(
                          child: Center(
                            child: Text(
                              "Check out",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 40),
                      ],
                    ),
                    SizedBox(height: 16),
                    _StepIndicator(),
                    SizedBox(height: 16),
                    Text(
                      "STEP 1",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 6),

                    Text(
                      "Shipping",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 18),
                    _TextFieldLabel(label: "First name", requiredField: true),
                    _UnderlineField(controller: _firstName),
                    SizedBox(height: 14),
                    _TextFieldLabel(label: "Last name", requiredField: true),
                    _UnderlineField(
                      controller: _lastName,
                      errorText: "Field is required",
                    ),
                    SizedBox(height: 14),
                    _TextFieldLabel(label: "Country", requiredField: true),
                    _UnderlineField(
                      controller: _country,
                      suffixIcon: Icon(Icons.keyboard_arrow_down),
                      readOnly: true,
                      onTap: () {},
                    ),

                    SizedBox(height: 14),
                    _TextFieldLabel(label: "Street name", requiredField: true),
                    _UnderlineField(controller: _street),
                    SizedBox(height: 14),
                    _TextFieldLabel(label: "City", requiredField: true),
                    _UnderlineField(controller: _city),
                    SizedBox(height: 14),
                    _TextFieldLabel(
                      label: "State / Province",
                      requiredField: false,
                    ),
                    _UnderlineField(controller: _state),
                    SizedBox(height: 14),
                    _TextFieldLabel(label: "Zip-code", requiredField: true),
                    _UnderlineField(controller: _zip),
                    SizedBox(height: 14),
                    _TextFieldLabel(label: "Phone number", requiredField: true),
                    _UnderlineField(controller: _phone),
                    SizedBox(height: 22),
                    Text(
                      "Shipping method",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10),
                    _ShippingRadioTile(
                      value: 0,
                      groupValue: state.selectedShipping,
                      onChanged: (v) {
                        context.read<DashboardBloc>().add(
                          ShippingMethodChanged(v),
                        );
                      },
                      title: "Free",
                      subtitle: "Delivery to home",
                      desc: "Delivery from 3 to 7 business days",
                    ),

                    _ShippingRadioTile(
                      value: 1,
                      groupValue: state.selectedShipping,
                      onChanged: (v) {
                        context.read<DashboardBloc>().add(
                          ShippingMethodChanged(v),
                        );
                      },
                      title: "\$9.90",
                      subtitle: "Delivery to home",
                      desc: "Delivery from 4 to 6 business days",
                    ),

                    _ShippingRadioTile(
                      value: 2,
                      groupValue: state.selectedShipping,
                      onChanged: (v) {
                        context.read<DashboardBloc>().add(
                          ShippingMethodChanged(v),
                        );
                      },
                      title: "\$9.90",
                      subtitle: "Fast Delivery",
                      desc: "Delivery from 2 to 3 business days",
                    ),
                    SizedBox(height: 22),
                    Text(
                      "Coupon Code",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _coupon,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Have a code? type it here...",
                                hintStyle: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Validate",
                              style: TextStyle(
                                color: Color(0xFF4C7B72),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 22),

                    Text(
                      "Billing Address",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10),

                    Row(
                      children: [
                        Checkbox(
                          value: state.copyAddress,
                          onChanged: (v) {
                            context.read<DashboardBloc>().add(
                              CopyAddress(v ?? false),
                            );
                          },
                        ),
                        Text(
                          "Copy address data from shipping",
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),

                    SizedBox(height: 70),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CircleBackButton extends StatelessWidget {
  final VoidCallback onTap;

  const _CircleBackButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 10,
              offset:  Offset(0, 4),
            ),
          ],
        ),
        child:  Center(child: Icon(Icons.arrow_back_ios_new, size: 18)),
      ),
    );
  }
}

class _StepIndicator extends StatelessWidget {
  const _StepIndicator();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Icon(Icons.location_on_outlined, size: 18, color: Colors.black),
         SizedBox(width: 8),

        Expanded(
          child: Row(
            children: List.generate(10, (index) {
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  height: 2,
                  color: index < 6 ? Colors.black : Colors.grey.shade300,
                ),
              );
            }),
          ),
        ),

         SizedBox(width: 8),
         Icon(Icons.credit_card, size: 18, color: Colors.grey),
         SizedBox(width: 8),
         Icon(Icons.check_circle_outline, size: 18, color: Colors.grey),
      ],
    );
  }
}

class _TextFieldLabel extends StatelessWidget {
  final String label;
  final bool requiredField;

  const _TextFieldLabel({required this.label, required this.requiredField});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (requiredField)
           Text(" *", style: TextStyle(color: Colors.red, fontSize: 12)),
      ],
    );
  }
}

class _UnderlineField extends StatelessWidget {
  final TextEditingController controller;
  final bool readOnly;
  final Widget? suffixIcon;
  final String? errorText;
  final VoidCallback? onTap;

  const _UnderlineField({
    required this.controller,
    this.readOnly = false,
    this.suffixIcon,
    this.errorText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: errorText != null ? Colors.red : Colors.grey.shade300,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: errorText != null ? Colors.red : Colors.black,
              ),
            ),
          ),
        ),
        if (errorText != null) ...[
           SizedBox(height: 6),
          Text(
            errorText!,
            style: const TextStyle(color: Colors.red, fontSize: 11),
          ),
        ],
      ],
    );
  }
}

class _ShippingRadioTile extends StatelessWidget {
  final int value;
  final int groupValue;
  final void Function(int) onChanged;
  final String title;
  final String subtitle;
  final String desc;

  const _ShippingRadioTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    required this.subtitle,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    final selected = value == groupValue;

    return InkWell(
      onTap: () => onChanged(value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Radio<int>(
              value: value,
              groupValue: groupValue,
              onChanged: (v) => onChanged(v!),
              activeColor:  Color(0xFF4C7B72),
            ),
             SizedBox(width: 6),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: selected ? Colors.black : Colors.grey.shade800,
                        ),
                      ),
                       SizedBox(width: 10),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                   SizedBox(height: 4),
                  Text(
                    desc,
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
