import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sub_notes_app/common/pages/something_went_wrong.dart';
import 'package:sub_notes_app/common/ui_functions/ui_functions.dart';
import 'package:sub_notes_app/common/widgets/notes_button.dart';
import 'package:sub_notes_app/core/config/assets/app_images.dart';
import 'package:sub_notes_app/core/config/theme/app_color.dart';
import 'package:sub_notes_app/core/config/extensions/extensions.dart';
import 'package:sub_notes_app/presentation/auth/signup_page/bloc/signup_bloc.dart';
import 'package:sub_notes_app/presentation/homepage/pages/homepage.dart';

class SignupAddInfo extends StatefulWidget {
  const SignupAddInfo({super.key});

  @override
  State<SignupAddInfo> createState() => _SignupAddInfoState();
}

class _SignupAddInfoState extends State<SignupAddInfo> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final SignupBloc signupBloc = SignupBloc();
  final List<String> _roles = [
    "Student",
    "Teacher",
  ];
  final List<String> _grades = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
  ];
  String _selectedRole = "Select a role";
  String _selectedGrade = "Select a grade";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            context.pop;
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.asset(
            AppImages.backgroundImage,
            fit: BoxFit.fitHeight,
            height: context.height,
          ),
          BlocConsumer<SignupBloc, SignupState>(
            bloc: signupBloc,
            listener: (context, state) {
              if (state is SignupSuccessState) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const HomePage()));
              } else if (state is SignupFailureState) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      title: Text('Error'),
                      content: Text('failure'),
                    );
                  },
                );
              }
            },
            builder: (context, state) {
              if (state is SignupInitialState) {
                return Center(
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
                        DropdownButtonFormField<String>(
                          value: _selectedRole,
                          items: _roles.map((role) {
                            return DropdownMenuItem<String>(
                              value: role,
                              child: Text(role),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedRole = value!;
                            });
                          },
                          icon: Transform.rotate(
                            angle: -pi / 2,
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: AppColors.black,
                              size: 18,
                            ),
                          ),
                          decoration: const InputDecoration(
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
                        ),
                        20.ah,
                        DropdownButtonFormField<String>(
                          value: _selectedGrade,
                          items: _grades.map((grade) {
                            return DropdownMenuItem<String>(
                              value: grade,
                              child: Text(grade),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedGrade = value!;
                            });
                          },
                          icon: Transform.rotate(
                            angle: -pi / 2,
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: AppColors.black,
                              size: 18,
                            ),
                          ),
                          decoration: const InputDecoration(
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
                        ),
                        20.ah,
                        TextField(
                          cursorColor: AppColors.black,
                          controller: _nameController,
                          decoration: const InputDecoration(
                            hintText: "Role",
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
                          onChanged: (value) {},
                        ),
                        20.ah,
                        TextField(
                          cursorColor: AppColors.black,
                          controller: _emailController,
                          decoration: const InputDecoration(
                            hintText: "Username",
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
                          onChanged: (value) {},
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
                        20.ah,
                        TextField(
                          cursorColor: AppColors.black,
                          controller: _confirmPasswordController,
                          decoration: const InputDecoration(
                            hintText: "Confirm Password",
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
                        ),
                        40.ah,
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  String name = _nameController.text;
                                  String email = _emailController.text;
                                  String password = _passwordController.text;
                                  String confirmPassword =
                                      _confirmPasswordController.text;
                                  if (password == confirmPassword) {
                                    if (email.isNotEmpty &&
                                        name.isNotEmpty &&
                                        password.isNotEmpty) {
                                      // signupBloc.add(SignupInitialEvent(
                                      //     name: name,
                                      //     email: email,
                                      //     password: password));
                                    } else {
                                      errorPopup(
                                        ctx: context,
                                        head: 'Fill all the fields',
                                        body:
                                            'Please ensure that important fields are filled',
                                      );
                                    }
                                  } else {
                                    errorPopup(
                                      ctx: context,
                                      head: 'Passwords do not match',
                                      body:
                                          'Please ensure that your passwords are identical.',
                                    );
                                  }
                                },
                                child: const NotesBtn(name: 'Sign Up'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is SignupLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.black,
                  ),
                );
              } else if (state is SignupErrorState) {
                return const SomethingWentWrong(
                    errorText: "The user already exists");
              }
              return const SomethingWentWrong();
            },
          ),
        ],
      ),
    );
  }
}
