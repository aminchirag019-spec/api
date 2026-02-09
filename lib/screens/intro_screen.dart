
import 'package:flutter/material.dart';

class IntroOnboarding extends StatefulWidget {
  const IntroOnboarding({super.key});

  @override
  State<IntroOnboarding> createState() => _IntroOnboardingState();
}

class _IntroOnboardingState extends State<IntroOnboarding> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<Map<String, dynamic>> pages = [
    {
      "type": "welcome",
      "bgImage": "assets/images/welcome.png",
      "title": "Welcome to GemStore!",
      "subtitle": "The home for fashionista",
      "buttonText": "Get Started",
    },
    {
      "type": "normal",
      "title": "Discover something new",
      "subtitle": "Special new arrivals just for you",
      "image": "assets/images/model1.png",
      "buttonText": "Shopping now",
    },
    {
      "type": "normal",
      "title": "Update trendy outfit",
      "subtitle": "Favorite brands and hottest trends",
      "image": "assets/images/model2.png",
      "buttonText": "Shopping now",
    },
    {
      "type": "normal",
      "title": "Explore your true style",
      "subtitle": "Relax and let us bring the style to you",
      "image": "assets/images/model3.png",
      "buttonText": "Shopping now",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: pages.length,
        onPageChanged: (index) {
          setState(() => currentIndex = index);
        },
        itemBuilder: (context, index) {
          final item = pages[index];

          // 1st Screen (Welcome)
          if (item["type"] == "welcome") {
            return Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  item["bgImage"],
                  fit: BoxFit.cover,
                ),

                // dark overlay
                Container(color: Colors.black.withOpacity(0.35)),

                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),

                        Text(
                          item["title"],
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          item["subtitle"],
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white70,
                          ),
                        ),

                        const SizedBox(height: 25),

                        SizedBox(
                          width: 170,
                          height: 46,
                          child: OutlinedButton(
                            onPressed: () {
                              // go to next page
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              item["buttonText"],
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),

                        const SizedBox(height: 60),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          // Remaining 3 Screens (Normal)
          return Stack(
            children: [
              // background
              Container(color: Colors.grey.shade300),

              // bottom dark part
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.36,
                  color: const Color(0xff3f3f3f),
                ),
              ),

              SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 35),

                    Text(
                      item["title"],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      item["subtitle"],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade700,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // image card
                    Container(
                      height: 300,
                      width: 230,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 12,
                            offset: const Offset(0, 7),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          item["image"],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const Spacer(),

                    // dots
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(pages.length - 1, (i) {
                        // dots only for last 3 screens (so total = 3 dots)
                        int dotIndex = i + 1;

                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: currentIndex == dotIndex ? 12 : 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: currentIndex == dotIndex
                                ? Colors.white
                                : Colors.white54,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        );
                      }),
                    ),

                    const SizedBox(height: 20),

                    // button
                    SizedBox(
                      width: 180,
                      height: 45,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          item["buttonText"],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 35),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
