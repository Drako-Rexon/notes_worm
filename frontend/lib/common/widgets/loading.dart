import 'package:flutter/material.dart';
import 'package:sub_notes_app/core/config/theme/app_color.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.black,
      ),
    );
  }
}
