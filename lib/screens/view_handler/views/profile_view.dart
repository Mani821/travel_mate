import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_companion/widgets/buttons/custom_button.dart';
import 'package:travel_companion/widgets/custom_textfield.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late TextEditingController controller;
  late TextEditingController emailController;
  late TextEditingController locationController;

  @override
  void initState() {
    controller = TextEditingController(text: "Username");
    emailController = TextEditingController(text: "user@mail.com");
    locationController = TextEditingController(text: "Jhelum, Pakistan");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 350,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/me.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.black,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black
                  ])),
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                          colors: [
                        Colors.black,
                        Colors.transparent,
                        Colors.transparent,
                      ])),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Mirza Mani",style: TextStyle(color: Colors.white,
                          fontSize: 24,fontWeight: FontWeight.w700),),
                          Text("Jhelum, Pakistan",style: TextStyle(color: Colors.white,
                              fontSize: 14,fontWeight: FontWeight.w700),)
                        ],
                      ),
                      IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/icons/edit.svg'))
                    ],
                  ),
                ),
              )
            ],
          ),

          const SizedBox(
            height: 22,
          ),
          MyTextField(
            controller: controller,
            hint: 'Enter your name',
          ),
          MyTextField(
            controller: emailController,
            hint: 'Enter your name',
            readOnly: true,
            enabled: false,
          ),
          MyTextField(
            controller: locationController,
            hint: 'Enter your location',
            readOnly: true,
          ),
          const SizedBox(
            height: 22,
          ),
          CustomButton(text: "Update", onPressed: () {}),
        ],
      ),
    );
  }
}
