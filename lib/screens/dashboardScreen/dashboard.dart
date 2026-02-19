import 'dart:math' hide log;
import 'package:api_learning/Bloc/Authbloc/auth_bloc.dart';
import 'package:api_learning/Bloc/DashboardBloc/dashboard_bloc.dart';
import 'package:api_learning/Bloc/DashboardBloc/dashboard_event.dart';
import 'package:api_learning/Bloc/DashboardBloc/dashboard_state.dart';
import 'package:api_learning/data/api_client.dart';
import 'package:api_learning/models/get_products.dart';
import 'package:api_learning/models/models.dart';
import 'package:api_learning/data/repository.dart';
import 'package:api_learning/router/router_class.dart';
import 'package:api_learning/screens/discoverScreen/discover_widget.dart';
import 'package:api_learning/screens/widgets/user_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'dart:developer';
import '../../Bloc/Authbloc/auth_state.dart';
import '../../globall/utilities.dart';

class Dashboard extends StatelessWidget {
   Dashboard({super.key});

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        final imageUrl = authState.loginModel?.image;
        final firstName = authState.loginModel?.firstName;
        final lastName = authState.loginModel?.lastName;
        return WillPopScope(
          onWillPop: () async {
            context.go(RouterName.dashboardScreen.path);
            return false;
          },
          child: Scaffold(
            key: _drawerKey,
            drawer: AppDrawer(),
            backgroundColor: Colors.white,
            body: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              _drawerKey.currentState?.openDrawer();
                            },
                            child: Icon(Icons.menu)),
                        SizedBox(width:  10,),
                        GestureDetector(
                          onTap: () {
                            context.go(RouterName.searchScreen.path);
                          },
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.grey.shade200,
                            backgroundImage:
                                (imageUrl != null && imageUrl.isNotEmpty)
                                ? NetworkImage(imageUrl)
                                : null,
                            child: (imageUrl == null || imageUrl.isEmpty)
                                ? Icon(Icons.person, color: Colors.grey)
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
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                lastName ?? "Not fetched",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            context.go(RouterName.loginScreen.path);
                          },
                          icon: Icon(Icons.logout),
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            BlocBuilder<DashboardBloc, DashboardState>(
                              builder: (context, state) {

                                return Row(
                                  children: List.generate(4, (index) {
                                    bool selected =
                                        state.selectedIndex == index;
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
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 15,
                                                  ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 8,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: selected
                                                    ? Colors.brown
                                                    : Color(0xffF3F3F3),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: selected
                                                    ? BoxBorder.all(
                                                        color: Colors.white,
                                                      )
                                                    : null,
                                              ),
                                              child: Image.asset(
                                                topRow[index].image,
                                                color: selected
                                                    ? Colors.white
                                                    : Colors.grey,
                                              ),
                                            ),
                                            SizedBox(height: 3),
                                            Text(
                                              topRow[index].tag,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              width: 330,
                              child: GestureDetector(
                                onTap: () {
                                  context.go(RouterName.cartScreen.path);
                                },
                                child: Image(
                                  image: AssetImage(
                                    "assets/images/slider_image.png",
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              height: 45,
                              width: double.infinity,
                              child: TextFormField(
                                onChanged: (value) {
                                  context.read<DashboardBloc>().add(
                                    SearchProduct(value),
                                  );
                                },
                                readOnly: false,
                                decoration: InputDecoration(
                                  hintText: "Search products...",
                                  hintStyle: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xffF3F3F3),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Feature Products",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    context.go(RouterName.showAllProducts.path);
                                  },
                                  child: Text(
                                    "Show all",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            BlocBuilder<DashboardBloc, DashboardState>(
                              builder: (context, state) {
                                if (state.status == ApiStatus.loading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (state.status == ApiStatus.failure) {
                                  return const Center(child: Text("Error"));
                                }

                                if (state.filteredProducts.isEmpty) {
                                  return const Center(
                                    child: Text("No products found"),
                                  );
                                }

                                return SizedBox(
                                  height: 200,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      final product =
                                          state.filteredProducts[index];
                                      return GestureDetector(
                                        onTap: () {
                                          final id = product.id;
                                          context.go(RouterName.productDetailScreen.path.replaceFirst(':id', id.toString()));
                                        },
                                        child: Container(
                                          width: 150,
                                          margin: const EdgeInsets.only(
                                            right: 12,
                                            left: 2,
                                            bottom: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              18,
                                            ),
                                            border: Border.all(
                                              color: Colors.black.withOpacity(
                                                0.08,
                                              ),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.06,
                                                ),
                                                blurRadius: 8,
                                                offset: Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.vertical(
                                                        top: Radius.circular(
                                                          18,
                                                        ),
                                                      ),
                                                  child: Image.network(
                                                    (product.images != null &&
                                                            product
                                                                .images!
                                                                .isNotEmpty)
                                                        ? product.images!.first
                                                        : "https://via.placeholder.com/150",
                                                    fit: BoxFit.cover,
                                                    width: double.infinity,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(
                                                  10,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      product.title ?? "",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 6),
                                                    Text(
                                                      "\$ ${product.price}",
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 170,
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "| NEW COLLECTION",
                                          style: TextStyle(
                                            fontSize: 10,
                                            letterSpacing: 2,
                                            color: Color(0xff777E90),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          "HANG OUT\n& PARTY",
                                          style: TextStyle(
                                            fontSize: 20,
                                            height: 1.1,
                                            color: Color(0xff2B2F38),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 160,
                                    height: 160,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          width: 120,
                                          height: 160,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey.withOpacity(
                                              0.10,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey.withOpacity(
                                              0.15,
                                            ),
                                          ),
                                        ),
                                        ClipOval(
                                          child: Image.asset(
                                            "assets/images/new_product.png",
                                            width: 130,
                                            height: 220,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Recommended",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {},
                                  child: Text(
                                    "Show all",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 100,
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.asset(
                                      "assets/images/recommended_image_1.png",
                                      height: 90,
                                      width: 90,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 14),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "White fashion hoodie",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "\$ 29.00",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Top Collection",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    context.go(RouterName.discoverScreen.path);
                                  },
                                  child: Text(
                                    "Show all",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 170,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "| Sale up to 40%",
                                          style: TextStyle(
                                            color: Color(0xff777E90),
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "FOR SLIM\n& BEAUTY",
                                          style: TextStyle(
                                            color: Color(0xff777E90),
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 160,
                                    height: 160,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          width: 120,
                                          height: 160,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey.withOpacity(
                                              0.10,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey.withOpacity(
                                              0.15,
                                            ),
                                          ),
                                        ),
                                        ClipOval(
                                          child: Image.asset(
                                            "assets/images/collection_image_1.png",
                                            width: 130,
                                            height: 220,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              height: 230,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("| Summer Collection 2021",
                                      style: TextStyle(
                                        color: Color(0xff777E90),
                                        fontSize: 13,
                                      ),
                                      ),
                                      SizedBox(height: 10,),
                                      Text("Most Sexy\n& fabulous\ndesign",style: TextStyle(
                                        color: Color(0xff353945),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600
                                      ),)
                                    ],
                                  )),
                                  SizedBox(
                                    child: Image.asset("assets/images/summer_collection_image.png"),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                        Container(
                          height: 200,
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8,
                                color: Colors.black12,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              // LEFT IMA
                              ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Image.asset(
                                  "assets/images/T-shirt_image.png",
                                  width: 120,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Nike Sportswear Club",
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      "Men's T-Shirt",
                                      style: TextStyle(fontSize: 13, color: Colors.grey),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "₹999",
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                        ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
