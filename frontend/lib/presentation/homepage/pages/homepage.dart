import 'package:flutter/material.dart';
import 'package:sub_notes_app/core/config/extensions/extensions.dart';

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
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: Center(child: Text((index + 1).toString())),
          );
        },
      ),
    );
  }
}
