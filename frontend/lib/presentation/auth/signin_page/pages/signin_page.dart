import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sub_notes_app/common/pages/something_went_wrong.dart';
import 'package:sub_notes_app/common/ui_functions/ui_functions.dart';
import 'package:sub_notes_app/common/widgets/loading.dart';
import 'package:sub_notes_app/common/widgets/notes_button.dart';
import 'package:sub_notes_app/core/config/assets/app_images.dart';
import 'package:sub_notes_app/core/config/theme/app_color.dart';
import 'package:sub_notes_app/core/extensions/extensions.dart';
import 'package:sub_notes_app/presentation/auth/signin_page/bloc/signin_bloc.dart';
import 'package:sub_notes_app/presentation/auth/signup_page/pages/signup_page.dart';
import 'package:sub_notes_app/presentation/homepage/pages/homepage.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final SigninBloc signinBloc = SigninBloc();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Sign In'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.asset(
            AppImages.backgroundImage,
            fit: BoxFit.fitHeight,
            height: context.height,
          ),
          BlocConsumer<SigninBloc, SigninState>(
            bloc: signinBloc,
            listener: (context, state) {
              if (state is SigninSuccessState) {
                context.push(const HomePage());
              } else if (state is SigninErrorState) {
                context.push(const SomethingWentWrong());
              }
            },
            builder: (context, state) {
              if (state is SigninLoadingState) {
                return const Loading();
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 40),
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                          color: AppColors.appLightYellow,
                          border: Border.all(color: AppColors.black, width: 4),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(18)),
                          boxShadow: const [
                            BoxShadow(
                                color: AppColors.black, offset: Offset(6, 8))
                          ]),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            cursorColor: AppColors.black,
                            controller: _emailController,
                            decoration: const InputDecoration(
                              hintText: "Username or Email",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(width: 3),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(width: 2),
                              ),
                            ),
                            onChanged: (value) {
                              // Handle text field input here
                            },
                          ),
                          20.ah,
                          TextField(
                            cursorColor: AppColors.black,
                            controller: _passwordController,
                            decoration: const InputDecoration(
                              hintText: "Password",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(width: 3),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(width: 2),
                              ),
                            ),
                            onChanged: (value) {
                              // Handle text field input here
                            },
                          ),
                          40.ah,
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    String email = _emailController.text
                                        .toLowerCase()
                                        .trim();
                                    String pass = _passwordController.text;
                                    log(pass);
                                    if (email.isNotEmpty && pass.isNotEmpty) {
                                      signinBloc.add(SigninInitialEvent(
                                          email: email, password: pass));
                                    } else {
                                      errorPopup(
                                          ctx: context,
                                          head: "Fill the fields",
                                          body:
                                              "Fill all the given fields for signing in");
                                    }
                                  },
                                  child: const NotesBtn(name: 'Sign In'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 120, vertical: 30),
                    child: Row(
                      children: [
                        Expanded(
                            child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const SignupPage()));
                                },
                                child: const NotesBtn(name: 'Sign up'))),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
