import 'package:flutter/material.dart';
import 'package:sub_notes_app/core/extensions/extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            context.pop;
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: const Center(
        child: Text('HomePage'),
      ),
    );
  }
}
