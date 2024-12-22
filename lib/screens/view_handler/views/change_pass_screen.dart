
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_companion/widgets/buttons/custom_button.dart';

import '../../../core/constants.dart';
import '../../../widgets/custom_textfield.dart';

class ChangePassPage extends ConsumerStatefulWidget {
  const ChangePassPage({super.key});

  @override
  ConsumerState<ChangePassPage> createState() => _ChangePassPageState();
}

class _ChangePassPageState extends ConsumerState<ChangePassPage> {
  final currentPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
        leading: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              "Enter your current password and new password below",
              style: GoogleFonts.lexend(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),


          MyTextField(
              controller: currentPassController,
              hint: 'Current Password'
          ),

          MyTextField(
            controller: newPassController,
            hint: 'New Password',
          ),
          MyTextField(
              controller: confirmPassController,
              hint: 'Confirm Password'
          ),
          const SizedBox(height: 50),
        CustomButton(text: 'Change password', onPressed: (){})
        ],
      ),
    );
  }




}
