import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingCarouselScreen extends StatefulWidget {
  const OnboardingCarouselScreen({super.key});

  @override
  State<OnboardingCarouselScreen> createState() =>
      _OnboardingCarouselScreenState();
}

class _OnboardingCarouselScreenState extends State<OnboardingCarouselScreen> {
  final CarouselSliderController _controller = CarouselSliderController();
  int currentIndex = 0;

  final List<Map<String, dynamic>> pages = [
    {
      "isFirst": true,
      "title": "Welcome to GemStore!",
      "subtitle": "The home for fashionista",
      "button": "Get Started",
      "image": "assets/images/welcome.png",
    },
    {
      "isFirst": false,
      "title": "Discover something new",
      "subtitle": "Special new arrivals just for you",
      "button": "Shopping now",
      "image": "assets/images/intro_image_1.png",
    },
    {
      "isFirst": false,
      "title": "Update trendy outfit",
      "subtitle": "Favorite brands and hottest trends",
      "button": "Shopping now",
      "image": "assets/images/intro_image_2.png",
    },
    {
      "isFirst": false,
      "title": "Explore your true style",
      "subtitle": "Relax and let us bring the style to you",
      "button": "Shopping now",
      "image": "assets/images/intro_image_3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider.builder(
        carouselController: _controller,
        itemCount: pages.length,
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          viewportFraction: 1,
          enableInfiniteScroll: false,
          scrollPhysics: const BouncingScrollPhysics(),
          onPageChanged: (index, reason) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        itemBuilder: (context, index, realIndex) {
          final data = pages[index];

          if (data["isFirst"] == true) {
            return _firstPage(data);
          } else {
            return _normalPage(data, index);
          }
        },
      ),
    );
  }

  // ================= FIRST PAGE =================
  Widget _firstPage(Map data) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            data["image"],
            fit: BoxFit.cover,
          ),
        ),

        // overlay
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.30),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal:90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                data["title"],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                data["subtitle"],
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 22),

              _button(
                text: data["button"],
                onTap: () {
                  _controller.nextPage();
                },
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }

  Widget _normalPage(Map data, int index) {
    return Column(
      children: [
        const SizedBox(height: 60),

        Text(
          data["title"],
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          data["subtitle"],
          style: TextStyle(
            fontSize: 12,
            color: Colors.black.withOpacity(0.5),
          ),
        ),

        const SizedBox(height: 30),

        Container(
          height: 320,
          width: 230,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(14),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              data["image"],
              fit: BoxFit.cover,
            ),
          ),
        ),

        const SizedBox(height: 25),


        Expanded(
          child: Container(
            width: double.infinity,
            color: const Color(0xff3e3e3e),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _dotsIndicator(),

                const SizedBox(height: 18),

                _button(
                  text: data["button"],
                  onTap: () async{
                    final prefs = await SharedPreferences.getInstance();
                    if (index == pages.length - 1) {
                      await prefs.setBool("onboardingDone", true);
                      final done = prefs.getBool("onboardingDone");
                      print("AFTER SAVE onboardingDone => $done");
                      context.go('/LoginScreen');
                    } else {
                      _controller.nextPage();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ================= DOTS =================
  Widget _dotsIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pages.length - 1,
            (i) {
          final active = (currentIndex - 1) == i;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 6,
            width: active ? 18 : 6,
            decoration: BoxDecoration(
              color: active ? Colors.white : Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.circular(20),
            ),
          );
        },
      ),
    );
  }

  // ================= BUTTON =================
  Widget _button({required String text, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44,
        width: 170,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.white.withOpacity(0.6)),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
