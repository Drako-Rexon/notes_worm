import 'package:flutter/material.dart';
import 'package:sub_notes_app/common/widgets/notes_button.dart';
import 'package:sub_notes_app/core/config/theme/app_color.dart';
import 'package:sub_notes_app/core/extensions/extensions.dart';
import 'package:sub_notes_app/presentation/auth/signin_page/bloc/signin_bloc.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final SigninBloc signinBloc = SigninBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Sign In'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 200),
          decoration: BoxDecoration(
              color: AppColors.appLightYellow,
              border: Border.all(color: AppColors.black, width: 4),
              borderRadius: const BorderRadius.all(Radius.circular(18)),
              boxShadow: const [
                BoxShadow(color: AppColors.black, offset: Offset(6, 8))
              ]),
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: "Username",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                onChanged: (value) {
                  // Handle text field input here
                },
              ),
              20.ah,
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: "Password",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                        signinBloc.add(SigninInitialEvent(
                            email: _emailController.text.trim(),
                            password: _passwordController.text));
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
    );
  }
}
