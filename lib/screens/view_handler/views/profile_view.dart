import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_companion/core/constants.dart';
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

  @override
  void initState() {
    controller = TextEditingController(text: "Username");
    emailController = TextEditingController(text: "user@mail.com");
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 50,
            ),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    margin: EdgeInsets.only(right: 10,bottom: 4),
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.upload_rounded,color: Colors.white,size: 20,),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text("Username",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("user@mail.com",
                style: TextStyle(
                    fontSize: 12, fontFamily: 'Lexend', color: Colors.grey)),
            Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primaryColor,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      color: backgroundColor,
                      size: 15,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text("Germany, Frankfurt",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Lexend',
                            color: backgroundColor)),
                  ],
                )),
            SizedBox(height: 22,),
            MyTextField(controller: controller,hint: 'Enter your name',),
            MyTextField(controller: emailController,hint: 'Enter your name',readOnly: true,enabled: false,),
            MyTextField(controller: emailController,hint: 'Enter your location',readOnly: true,),
            SizedBox(height: 22,),CustomButton(text: "Update", onPressed: (){}),
          ],
        ),
      ),
    );
  }
}
