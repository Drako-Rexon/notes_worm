import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sub_notes_app/core/config/extensions/extensions.dart';
import 'package:sub_notes_app/presentation/homepage/bloc/homepage_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomepageBloc _homepageBloc = HomepageBloc();

  @override
  void initState() {
    super.initState();
    _homepageBloc.add(HomePageInitLoadEvent());
  }

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
      body: BlocConsumer<HomepageBloc, HomepageState>(
        bloc: _homepageBloc,
        listener: (context, state) {},
        builder: (context, state) {
          return GridView.builder(
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
          );
        },
      ),
    );
  }
}
