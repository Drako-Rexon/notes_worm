import 'package:flutter/material.dart';
import 'package:sub_notes_app/presentation/homepage/pages/homepage.dart';
import 'package:sub_notes_app/presentation/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashScreenBloc splashScreenBloc = SplashScreenBloc();

  @override
  void initState() {
    super.initState();
    splashScreenBloc.add(SplashScreenFetchEvent());
  }

  void navigate() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashScreenBloc, SplashScreenState>(
        bloc: splashScreenBloc,
        listener: (context, state) {
          if (state is SplashScreenSuccess) {
            navigate();
          }
        },
        builder: (context, state) {
          if (state is SplashScreenLoading) {
            return const Center(
              child: FlutterLogo(),
            );
          } else if (state is SplashScreenError) {
            return const Center(
              child: Text('Something went wrong...'),
            );
          } else if (state is SplashScreenSuccess) {
            // navigate();
            return const SizedBox();
          } else {
            return const Center(
              child: Text('Loading...'),
            );
          }
        },
      ),
    );
  }
}
