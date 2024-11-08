import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sub_notes_app/core/config/assets/app_lottie_animations.dart';
import 'package:sub_notes_app/core/config/extensions/extensions.dart';

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({
    super.key,
    this.errorText,
  });
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            context.pop;
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppLottieAnimations.error),
            Text(
              errorText ?? 'Something went wrong',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
