import 'package:flutter/material.dart';
import 'package:sub_notes_app/core/config/theme/app_color.dart';

class NotesBtn extends StatelessWidget {
  const NotesBtn({
    super.key,
    required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        color: AppColors.appYellow,
      ),
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
