import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_companion/core/constants.dart';
import 'package:travel_companion/widgets/custom_textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearching = false;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                  icon: SvgPicture.asset('assets/icons/search.svg'),
                )
              ],
            ),
          ),
          AnimatedCrossFade(
              firstChild: const SizedBox(),
              secondChild: MyTextField(controller: controller,hint: "Search...",),
              crossFadeState: isSearching
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: 350.ms),
          const SizedBox(height: 20),
          SizedBox(
            height: 75,
            child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return AnimatedContainer(
                    margin: const EdgeInsets.symmetric(horizontal: 6) +  EdgeInsets.only(left: index == 0 ?6 : 0),

                    width: 75,
                    duration: 300.ms,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  );
                }),
          ),


        ],
      )),
    );
  }
}
