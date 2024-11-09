import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sub_notes_app/common/pages/something_went_wrong.dart';
import 'package:sub_notes_app/common/ui_functions/ui_functions.dart';
import 'package:sub_notes_app/common/widgets/loading.dart';
import 'package:sub_notes_app/common/widgets/notes_button.dart';
import 'package:sub_notes_app/core/config/assets/app_images.dart';
import 'package:sub_notes_app/core/config/theme/app_color.dart';
import 'package:sub_notes_app/core/config/extensions/extensions.dart';
import 'package:sub_notes_app/presentation/auth/signin_page/pages/signin_page.dart';
import 'package:sub_notes_app/presentation/auth/signup_page/bloc/signup_bloc.dart';
import 'package:sub_notes_app/presentation/auth/signup_page/pages/signup_add_info_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final SignupBloc signupBloc = SignupBloc();
  final List<String> _roles = [
    "student",
    "teacher",
  ];
  final List<String> _standards = [
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
    "12"
  ];
  String _selectedRole = "";
  String _selectedStandard = "";

  bool hidePassword = true;

  @override
  void initState() {
    super.initState();
    _selectedRole = _roles[0].toLowerCase();
    _selectedStandard = _standards[0];
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocConsumer<SignupBloc, SignupState>(
                bloc: signupBloc,
                listener: (context, state) {
                  if (state is SignupSuccessState) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SignupAddInfo()));
                  } else if (state is SignupErrorState) {
                    context.push(const SomethingWentWrong());
                  }
                },
                builder: (context, state) {
                  if (state is SignupInitialState) {
                    return signup(context);
                  } else if (state is SignupLoadingState) {
                    return const Loading();
                  } else if (state is SignupErrorState) {
                    return const Center(
                      child: Text('Something went wrong'),
                    );
                  }
                  return const Column(
                    children: [
                      Loading(),
                      Text('Something went wrong'),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column signup(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            margin: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
                color: AppColors.appLightYellow,
                border: Border.all(color: AppColors.black, width: 4),
                borderRadius: const BorderRadius.all(Radius.circular(18)),
                boxShadow: const [
                  BoxShadow(color: AppColors.black, offset: Offset(6, 8))
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  cursorColor: AppColors.black,
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: "Full Name",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(width: 3),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(width: 2),
                    ),
                  ),
                  onChanged: (value) {},
                ),
                20.ah,
                TextField(
                  cursorColor: AppColors.black,
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    hintText: "Username",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(width: 3),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
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
                    hintText: "Email",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(width: 3),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(width: 2),
                    ),
                  ),
                  onChanged: (value) {},
                ),
                20.ah,
                TextFormField(
                  obscureText: hidePassword,
                  cursorColor: AppColors.black,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        child: Icon(
                          hidePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    hintText: "Password",
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(width: 2),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(width: 3),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(width: 2),
                    ),
                  ),
                  onChanged: (value) {},
                ),
                20.ah,
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: DropdownButtonFormField<String>(
                        value: _selectedRole,
                        hint: const Text("Select a Role"),
                        items: _roles.map((role) {
                          return DropdownMenuItem(
                            value: role,
                            child: Text(capitalizeFirstLetter(role)),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedRole = value!.toLowerCase();
                          });
                        },
                        icon: const SizedBox.shrink(),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(width: 3),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(width: 2),
                          ),
                        ),
                      ),
                    ),
                    10.aw,
                    Expanded(
                      flex: 3,
                      child: DropdownButtonFormField<String>(
                        value: _selectedStandard,
                        hint: const Text("Grade"),
                        items: _standards.map((standard) {
                          return DropdownMenuItem(
                            value: standard,
                            child: Text(standard),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedRole = value!.toLowerCase();
                          });
                        },
                        icon: const SizedBox.shrink(),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(width: 3),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(width: 2),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                          String username = _usernameController.text;

                          if (password.isNotEmpty) {
                            if (email.isNotEmpty &&
                                username.isNotEmpty &&
                                name.isNotEmpty &&
                                password.isNotEmpty) {
                              signupBloc.add(
                                SignupInitialEvent(
                                    name: name,
                                    email: email,
                                    password: password,
                                    username: username,
                                    role: _selectedRole,
                                    standard: _selectedStandard),
                              );
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
                              head: 'Passwords is empty',
                              body: 'Please fill the password field.',
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
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 30),
          child: Row(
            children: [
              Expanded(
                  child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SigninPage()));
                      },
                      child: const NotesBtn(name: 'Sign in'))),
            ],
          ),
        ),
      ],
    );
  }

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;

    return '${text[0].toUpperCase()}${text.substring(1).toLowerCase()}';
  }
}
