import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_companion/screens/view_handler/views/fav_view.dart';
import 'package:travel_companion/screens/view_handler/views/home_view.dart';
import 'package:travel_companion/screens/view_handler/views/profile_view.dart';
import 'package:travel_companion/screens/view_handler/views/setting_view.dart';

class MainViewHandler extends StatefulWidget {
  const MainViewHandler({super.key});

  @override
  State<MainViewHandler> createState() => _MainViewHandlerState();
}

class _MainViewHandlerState extends State<MainViewHandler>
    with TickerProviderStateMixin {
  int selectedIndex = 0;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFF6F8F9),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xFFF6F8F9),
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: TabBarView(
                        controller: tabController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: const [
                      HomeView(),
                      FavView(),
                      ProfileView(),
                      SettingView(),
                    ])),
                TabBar(
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    controller: tabController,
                    splashBorderRadius: BorderRadius.circular(8),
                    tabs: [
                      Tab(
                        icon: AnimatedCrossFade(
                            firstChild:
                                SvgPicture.asset('assets/icons/homeOutline.svg'),
                            secondChild:
                                SvgPicture.asset('assets/icons/homeFill.svg'),
                            crossFadeState: selectedIndex == 0
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                            duration: 200.ms),
                      ),
                      Tab(
                        icon: AnimatedCrossFade(
                            firstChild:
                                SvgPicture.asset('assets/icons/heartOutline.svg'),
                            secondChild:
                                SvgPicture.asset('assets/icons/heartFill.svg'),
                            crossFadeState: selectedIndex == 1
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                            duration: 200.ms),
                      ),
                      Tab(
                        icon: AnimatedCrossFade(
                            firstChild: SvgPicture.asset(
                                'assets/icons/personOutline.svg'),
                            secondChild:
                                SvgPicture.asset('assets/icons/personFill.svg'),
                            crossFadeState: selectedIndex == 2
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                            duration: 200.ms),
                      ),
                      Tab(
                        icon: AnimatedCrossFade(
                            firstChild: SvgPicture.asset(
                                'assets/icons/settingsOutline.svg'),
                            secondChild:
                                SvgPicture.asset('assets/icons/settingsFill.svg'),
                            crossFadeState: selectedIndex == 3
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                            duration: 200.ms),
                      ),
                    ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
