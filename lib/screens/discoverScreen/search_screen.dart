import 'package:api_learning/Bloc/DashboardBloc/dashboard_bloc.dart';
import 'package:api_learning/Bloc/DashboardBloc/dashboard_event.dart';
import 'package:api_learning/Bloc/DashboardBloc/dashboard_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  TextEditingController textController = TextEditingController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocListener<DashboardBloc, DashboardState>(
      listener: (context, state) {        // TODO: implement listener
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color(0xffFAFAFA),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Icon(Icons.arrow_back_ios_new, size: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 250,
                    child: TextFormField(
                      controller: textController,
                      focusNode: focusNode,
                      maxLines: 1,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        hintText: "Search..",
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Color(0xffFAFAFA),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        print("ENTER PRESSED: $value");
                        context.read<DashboardBloc>().add(RecentText(value));
                        focusNode.unfocus();
                      },
                    )

                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffFAFAFA),
                    ),
                    child: Image.asset("assets/images/filter.png"),
                  ),
                ],
              ),
              BlocBuilder<DashboardBloc, DashboardState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      if (state.text.isNotEmpty)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Recent Searches",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF33302E40),
                              ),
                            ),
                            Icon(
                              Icons.delete,
                              size: 18,
                              color: Color(0xFF33302E40),
                            ),
                          ],
                        ),
                      Text(
                        state.text.isEmpty ? "Nothing typed yet" : state.text,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}
