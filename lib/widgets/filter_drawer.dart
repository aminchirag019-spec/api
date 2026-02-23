import 'package:api_learning/Bloc/DashboardBloc/dashboard_event.dart';
import 'package:api_learning/screens/dashboardScreen/dashboard.dart';
import 'package:api_learning/screens/dashboardScreen/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../Bloc/DashboardBloc/dashboard_bloc.dart';
import '../Bloc/DashboardBloc/dashboard_state.dart';

class FilterDrawer extends StatefulWidget {
  const FilterDrawer({super.key});

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  RangeValues priceRange = const RangeValues(10, 80);
  int selectedColorIndex = 0;
  int selectedRating = 5;
  String selectedCategory = "Crop Tops";
  final List<Color> colors = const [
    Color(0xFFD28B2D),
    Color(0xFFE84C4C),
    Color(0xFF141F42),
    Color(0xFF3A4A4E),
    Color(0xFFE5E7EB),
    Color(0xFF6B4B3E),
    Color(0xFFE6B5B5),
  ];

  final List<String> categories = const [
    "Crop Tops",
    "T-Shirts",
    "Jeans",
    "Jackets",
    "Shoes",
  ];

  final List<String> discounts = const [
    "50% off",
    "40% off",
    "30% off",
    "25% off",
  ];

  final Set<String> selectedDiscounts = {"50% off", "40% off"};

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width * 0.72,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          bottomLeft: Radius.circular(28),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                   Expanded(
                    child: Text(
                      "Filter",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.tune)),
                ],
              ),
              Divider(height: 62),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Price
                      Text(
                        "Price",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),

                      RangeSlider(
                        values: priceRange,
                        min: 0,
                        max: 200,
                        divisions: 200,
                        onChanged: (val) {
                          setState(() => priceRange = val);
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$${priceRange.start.toInt()}"),
                          Text("\$${priceRange.end.toInt()}"),
                        ],
                      ),
                      SizedBox(height: 26),
                      Text(
                        "Color",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 12),

                      BlocBuilder<DashboardBloc, DashboardState>(
                        builder: (context, state) {
                          return Wrap(
                            spacing: 14,
                            runSpacing: 14,
                            children: List.generate(colors.length, (index) {
                              final isSelected = selectedColorIndex == index;

                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedColorIndex = index;
                                  });

                                  context.read<DashboardBloc>().add(
                                    Selection(index),
                                  );
                                },
                                child: Container(
                                  height: 28,
                                  width: 28,
                                  decoration: BoxDecoration(
                                    color: colors[index],
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color:
                                      isSelected ? Colors.black : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                      SizedBox(height: 26),
                      Text(
                        "Star Rating",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 12),

                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: List.generate(5, (index) {
                          final rating = index + 1;
                          final isSelected = selectedRating == rating;

                          return GestureDetector(
                            onTap: () {
                              context.read<DashboardBloc>().add(
                                Selection(index),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Color(0xFF1F1F1F)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(26),
                                border: Border.all(color: Colors.black12),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 18,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "$rating",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 26),
                      Text(
                        "Category",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 12),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: Colors.black12),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: Colors.white,
                            value: selectedCategory,
                            isExpanded: true,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: categories.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Row(
                                  children: [
                                    Icon(Icons.checkroom, size: 18),
                                    SizedBox(width: 10),
                                    Text(e),
                                  ],
                                ),
                              );
                            }).toList(),
                            onChanged: (val) {
                              if (val == null) return;
                              setState(() => selectedCategory = val);
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 26),
                      Text(
                        "Discount",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 12),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: discounts.map((d) {
                          final isSelected = selectedDiscounts.contains(d);

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  selectedDiscounts.remove(d);
                                } else {
                                  selectedDiscounts.add(d);
                                }
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(26),
                                border: Border.all(color: Colors.black26),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    d,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  if (isSelected) ...[
                                    SizedBox(width: 10),
                                    Icon(Icons.close, size: 18),
                                  ],
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 28),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          priceRange = RangeValues(10, 80);
                          selectedColorIndex = 0;
                          selectedRating = 5;
                          selectedCategory = "Crop Tops";
                          selectedDiscounts.clear();
                        });
                      },
                      child: Text(
                        "Reset",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1F1F1F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        context.pop(context);
                      },
                      child: Text(
                        "Apply",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
