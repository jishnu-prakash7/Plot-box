// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:plotbox/main.dart';
import 'package:plotbox/screens/movie/home_screen/screen.dart';
import 'package:plotbox/screens/user/user_login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/main_refactoring.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [maintitle()],
          ),
        ),
      ),
    );
  }

  Future<void> gotologin() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return const UserLogin();
    }));
  }

  Future<void> checkUserLoggedIn() async {
    final sharedprefs = await SharedPreferences.getInstance();
    final userLoggedIn = sharedprefs.getBool(KEY);
    if (userLoggedIn == null || userLoggedIn == false) {
      gotologin();
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const HomeScreen()));
    }
  }
}
