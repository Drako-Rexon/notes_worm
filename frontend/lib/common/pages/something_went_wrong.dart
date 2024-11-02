import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sub_notes_app/core/config/assets/app_lottie_animations.dart';

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppLottieAnimations.error),
            const Center(
              child: Text(
                'Something went wrong',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
