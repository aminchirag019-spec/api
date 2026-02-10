import 'package:api_learning/Bloc/Authbloc/auth_bloc.dart';
import 'package:api_learning/Bloc/DashboardBloc/dashboard_bloc.dart';
import 'package:api_learning/Bloc/DashboardBloc/dashboard_event.dart';
import 'package:api_learning/Bloc/DashboardBloc/dashboard_state.dart';
import 'package:api_learning/data/api_client.dart';
import 'package:api_learning/models/models.dart';
import 'package:api_learning/data/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../Bloc/Authbloc/auth_state.dart';
import '../globall/utilities.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(AuthRepository(ApiClient()))..add(GetProduct()),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) {
          final imageUrl = authState.loginModel?.image;
          final firstName = authState.loginModel?.firstName;
          final lastName = authState.loginModel?.lastName;
          return WillPopScope(
            onWillPop: () async{
              context.go('/Dashboard');
              return false;
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.go('/ProfileScreen');
                              },
                              child: CircleAvatar(
                                radius: 22,
                                backgroundColor: Colors.grey.shade200,
                                backgroundImage:
                                (imageUrl != null && imageUrl.isNotEmpty)
                                    ? NetworkImage(imageUrl)
                                    : null,
                                child: (imageUrl == null || imageUrl.isEmpty)
                                    ? const Icon(Icons.person, color: Colors.grey)
                                    : null,
                              ),
                            ),

                             SizedBox(width: 12),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    firstName ?? "Not fetched",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    lastName ?? "Not fetched",
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),

                            IconButton(
                              onPressed: () {
                                context.go('/LoginScreen');
                              },
                              icon: const Icon(Icons.logout),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        BlocBuilder<DashboardBloc, DashboardState>(
                          builder: (context, state) {
                            return Row(
                              children: List.generate(4, (index) {
                                bool selected = state.selectedIndex == index;
                                return GestureDetector(
                                  onTap: () {
                                    context.read<DashboardBloc>().add(
                                      Selection(index),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 15,
                                          ),
                                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                                          decoration: BoxDecoration(
                                            color: selected
                                                ? Colors.brown
                                                : Color(0xffF3F3F3),
                                            borderRadius: BorderRadius.circular(30),
                                            border: selected
                                              ? BoxBorder.all(color: Colors.white)
                                                : null
                                          ),
                                          child: Image.asset(topRow[index].image,
                                            color:selected
                                            ? Colors.white
                                            : Colors.grey,
                                          ),
                                        ),
                                        SizedBox(height: 3,),
                                        Text(topRow[index].tag,style: TextStyle(fontSize: 12),)
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                        SizedBox(height: 10,),
                         SizedBox(
                          width: 330,
                          child: Image(
                            image: AssetImage("assets/images/slider_image.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 45,
                          width: double.infinity,
                          child: TextFormField(
                            readOnly: false,
                            decoration: InputDecoration(
                              hintText: "Search products...",
                              hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                              prefixIcon: const Icon(Icons.search, color: Colors.grey),
                              filled: true,
                              fillColor: const Color(0xffF3F3F3),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Feature Products",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                                onTap: () async {
                                  context.go('/OtpScreen');
                                }, child: const Text(
                                "Show all",
                                style: TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        BlocBuilder<DashboardBloc, DashboardState>(
                          builder: (context, state) {
                            if (state.status == ApiStatus.loading) {
                              return const Center(child: CircularProgressIndicator());
                            }
                            if (state.status == ApiStatus.failure) {
                              return Text("Error");
                            }
                            return GridView.builder(
                              itemCount: state.product!.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: 0.72,
                              ),
                              itemBuilder: (context, index) {
                                final product = state.product![index];
                                return GestureDetector(
                                  onTap: () {
                                    final id = product.id!;
                                    context.go('/ProductDetails/$id');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(18),
                                      border: Border.all(color: Colors.black.withOpacity(0.08)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.06),
                                          blurRadius: 8,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Image (takes fixed ratio)
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius: const BorderRadius.vertical(
                                              top: Radius.circular(18),
                                            ),
                                            child: Image.network(
                                              product.images!.first,
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                            ),
                                          ),
                                        ),

                                        // Text area
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                product.title.toString(),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 13,
                                                ),
                                              ),
                                              const SizedBox(height: 6),
                                              Text(
                                                "\$ ${product.price}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
