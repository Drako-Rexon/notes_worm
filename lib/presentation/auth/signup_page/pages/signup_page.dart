import 'package:flutter/material.dart';
import 'package:sub_notes_app/core/config/theme/app_color.dart';
import 'package:sub_notes_app/core/extensions/extensions.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 180),
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
              20.ah,
              TextField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  hintText: "Confirm Password",
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
              ),
              40.ah,
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 4,
                            color: AppColors.black,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.black,
                              offset: Offset(6, 8),
                            ),
                          ],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          color: AppColors.appYellow,
                        ),
                        child: const Text(
                          'Sign Up',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
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
