import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sub_notes_app/core/config/assets/app_lottie_animations.dart';
import 'package:sub_notes_app/presentation/auth/signin_page/pages/signin_page.dart';
import 'package:sub_notes_app/presentation/auth/signup_page/pages/signup_page.dart';
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
        // context, MaterialPageRoute(builder: (_) => SigninPage()));
        context,
        MaterialPageRoute(builder: (_) => SignupPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashScreenBloc, SplashScreenState>(
        bloc: splashScreenBloc,
        listener: (context, state) {
          if (state is SplashScreenSuccessState) {
            navigate();
          }
        },
        builder: (context, state) {
          if (state is SplashScreenLoadingState) {
            return Center(
              child: Lottie.asset(AppLottieAnimations.loading),
            );
          } else if (state is SplashScreenErrorState) {
            return const Center(
              child: Text('Something went wrong...'),
            );
          } else if (state is SplashScreenSuccessState) {
            return const SizedBox();
          } else if (state is SplashScreenNoInternetState) {
            return Column(
              children: [
                Lottie.asset(AppLottieAnimations.noInternet),
                const Center(child: Text('No Internet Connection...'))
              ],
            );
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
