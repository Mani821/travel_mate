import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants.dart';
import '../../../services/app_data_service.dart';
import '../../../widgets/custom_textfield.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSearching = false;
  final controller = TextEditingController();
  int selectedIndex = 0;
  final pageController = PageController();



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 14.0, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag: 'auth',
                child: Image.asset(
                  'assets/images/appIcon.png',
                  height: 60,
                  width: 60,
                ),
              ),
              Column(
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'Welcome, ',
                      style: GoogleFonts.lexend(fontSize: 20, height: 0),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Mani',
                          style: GoogleFonts.lexend(
                              fontWeight: FontWeight.w600,
                              color: primaryColor,
                              height: 0),
                        ),
                      ],
                    ),
                  ),
                  Transform.rotate(
                    angle: -0.04,
                    child: Text(
                      "Let's travel together",
                      style: GoogleFonts.rancho(
                          height: -0, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isSearching = !isSearching;
                  });
                },
                icon: isSearching
                    ? const Icon(Icons.close_rounded)
                    : SvgPicture.asset('assets/icons/search.svg'),
              )
            ],
          ),
        ),
        Center(
          child: AnimatedCrossFade(
              firstChild: const SizedBox(),
              secondChild: MyTextField(
                controller: controller,
                hint: "Search...",
              ),
              crossFadeState: isSearching
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: 250.ms),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(AppData.categories.length, (index) {
              final delay = (index * 80).ms;
              final selected = index == selectedIndex;
              final value = AppData.categories[index];
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    splashColor: primaryColor.withOpacity(0.3),
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        pageController.jumpToPage(index);
                      });
                    },
                    child: AnimatedContainer(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 2),
                      duration: 200.ms,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              selected ? primaryColor : Colors.white,
                              selected
                                  ? secondaryColor.withOpacity(0.8)
                                  : Colors.white,
                            ]),
                        borderRadius: BorderRadius.circular(10),
                        border: selected
                            ? null
                            : Border.all(color: primaryColor, width: 1.6),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            value.icon,
                            height: 35,
                            width: 35,
                            color: selected ? Colors.white : primaryColor,
                          ),
                          Text(value.title,
                              style: GoogleFonts.lexend(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: selected
                                      ? Colors.white
                                      : Colors.black)),
                        ],
                      ),
                    ).animate().scale(delay: delay),
                  ),
                ),
              );
            }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: AnimatedSwitcher(
            duration: 250.ms,
            transitionBuilder:
                (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Align(
              alignment: Alignment.centerLeft,
              key: ValueKey(selectedIndex),
              child: Text(
                AppData.headings[selectedIndex],
                style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w600, fontSize: 18),
              ),
            ),
          ),
        ),
        Expanded(
          child: PageView.builder(
              controller: pageController,
              itemCount: AppData.categories.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GridView.builder(
                    itemCount: 6,
                    padding: const EdgeInsets.all(8),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 6),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color:
                            Colors.grey.withOpacity(0.35),
                            borderRadius: BorderRadius.circular(10)),
                      )
                          .animate(onPlay: (p) => p.repeat())
                          .shimmer(duration: 1400.ms);
                    });
              }),
        ),
      ],
    );
  }
}
