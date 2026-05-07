import 'package:docdoc/core/theming/colors%20manegments.dart';
import 'package:docdoc/core/theming/txt_style.dart';
import 'package:docdoc/core/widgets/app_botton.dart';
import 'package:docdoc/core/widgets/txtfield.dart';
import 'package:docdoc/features/auth/presintion/screens/login_screen.dart';
import 'package:flutter/material.dart';
import '../../../../core/theming/icons.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController   nameController = TextEditingController();
  final TextEditingController   emailController = TextEditingController();
  final TextEditingController   passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorsmanegments.backgroundapp,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          "lib/core/assets/Mobile Logo .png",
                          width: 187,
                          height: 30,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Create Account",
                            style: TxtStyle.size24w400black,
                          ),
                          Text(
                            "Enter your details to register for a secure patient portal.",
                            style: TxtStyle.size16w300black,
                          ),
                          const SizedBox(height: 25),
                          Text("Full Name", style: TxtStyle.size12w400black),
                          Txtfield(
                            hintText: "Ahmed Tarek",
                            prefixIcon: Iconss.person,
                              controller: nameController,
                          ),
                          const SizedBox(height: 15),
                          Text("Email", style: TxtStyle.size12w400black),
                          Txtfield(
                            hintText: "Email Address",
                            prefixIcon: Iconss.email, controller: emailController,
                          ),
                          const SizedBox(height: 15),
                          Text("Password", style: TxtStyle.size12w400black),
                          Txtfield(
                            hintText: "Password",
                            prefixIcon: Iconss.pass,
                              controller: passController,
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Must be at least 8 characters.",
                            style: TxtStyle.size12w400black,
                          ),
                          const SizedBox(height: 25),
                          AppBotton(
                            width: double.infinity,
                            txt: 'Create Account', onTap: () {  },
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account? "),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Log in here",
                                  style: TxtStyle.size14w800primary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
