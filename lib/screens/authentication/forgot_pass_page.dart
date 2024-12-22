import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_companion/widgets/buttons/custom_button.dart';

import '../../core/validators.dart';
import '../../services/app_data_service.dart';
import '../../services/auth_service.dart';
import '../../widgets/custom_textfield.dart';

class ForgotPassPage extends ConsumerStatefulWidget {
  const ForgotPassPage({super.key});

  @override
  ConsumerState<ForgotPassPage> createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends ConsumerState<ForgotPassPage> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.chevron_left)),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  "Forgot Password",
                  style: GoogleFonts.lexend(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  "Enter your email address below to receive password reset instructions",
                  style: GoogleFonts.lexend(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
             Padding(
               padding: const EdgeInsets.all(14.0),
               child: Text("Email"),
             ),
              MyTextField(
                controller: emailController,
                hint: "Enter your email",
                validator: emailValidator,
              ),
              const SizedBox(height: 100),
             CustomButton(text: "Sent email", onPressed: (){})

            ],
          ),
        ),
      ),
    );
  }

  Future sendRequest() async {

    AppData.showLoading(context);
    final result = await ref
        .read(authServiceProvider)
        .sendResetRequest(email: emailController.text.trim(),context: context);

    result.fold((l) {
      AppData.hideLoading(context);
      AppData.showSnackBar(context, l.message);
    }, (r) {
      AppData.hideLoading(context);
      emailController.clear();
      Navigator.pop(context);
    });
  }
}
