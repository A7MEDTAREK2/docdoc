import 'package:dio/dio.dart';
import 'package:docdoc/core/theming/colors%20manegments.dart';
import 'package:docdoc/core/theming/txt_style.dart';
import 'package:docdoc/core/widgets/app_botton.dart';
import 'package:docdoc/core/widgets/txtfield.dart';
import 'package:docdoc/features/auth/presintion/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theming/icons.dart';
import '../../../all_doctor/presentation/screens/screen doctor.dart';
import '../../../home/presintion/screens/home screen.dart';
import '../../data/datasourse/dataSourse_Auth.dart';
import '../../data/model/signup/signup_request.dart';
import '../../data/repo/repo_Auth.dart';
import '../../logic/cubit_Auth.dart';
import '../../logic/state.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passConfirmController = TextEditingController();

  int selectedGender = 0;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    phoneController.dispose();
    passConfirmController.dispose();
    super.dispose();
  }

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
                            prefixIcon: Iconss.email,
                            controller: emailController,
                          ),

                          const SizedBox(height: 15),

                          Text("phone", style: TxtStyle.size12w400black),

                          Txtfield(
                            hintText: "01xxxxxxxxxx",
                            prefixIcon: Iconss.phone,
                            controller: phoneController,
                          ),

                          const SizedBox(height: 15),

                          Text("Password", style: TxtStyle.size12w400black),

                          Txtfield(
                            hintText: "Password",
                            prefixIcon: Iconss.pass,
                            controller: passController,
                            isPassword: true,
                          ),

                          const SizedBox(height: 15),

                          Text(
                            "password Confirmation",
                            style: TxtStyle.size12w400black,
                          ),

                          Txtfield(
                            hintText: "password_confirmation",
                            prefixIcon: Iconss.pass,
                            controller: passConfirmController,
                            isPassword: true,
                          ),

                          const SizedBox(height: 15),

                          Text(
                            "Must be at least 8 characters.",
                            style: TxtStyle.size12w400black,
                          ),

                          const SizedBox(height: 25),

                          BlocConsumer<signupCubit, StateSignup>(
                            listener: (context, state) {
                              if (state is SignupLoadedState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Account Created Successfully",
                                    ),
                                    backgroundColor: Colors.green,
                                  ),
                                );

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Homescreen(),
                                  ),
                                );
                              } else if (state is SignupErrorState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(state.message),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            },

                            builder: (context, state) {
                              if (state is SignupLoadingState) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              return AppBotton(
                                width: double.infinity,
                                txt: 'Create Account',

                                onTap: () {
                                  context.read<signupCubit>().signup(
                                    SignupRequestBody(
                                      name: nameController.text,
                                      email: emailController.text,
                                      phone: phoneController.text,
                                      gender: selectedGender.toString(),
                                      password: passController.text,
                                      passwordConfirmation:
                                          passConfirmController.text,
                                    ),
                                  );
                                },
                              );
                            },
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
                                      builder: (context) => BlocProvider(
                                        create: (context) => LoginCubit(AuthloginRepo(LoginImp(Dio()))),
                                        child: const LoginScreen(),
                                      ),
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
