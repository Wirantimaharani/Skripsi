import 'package:flutter/material.dart';

import '../../utilities/colors.dart';
import '../welcome/welcome_scree.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const WelcomeScreen(),
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            color: KSplashClr,
            image: DecorationImage(
              image: AssetImage(
                "assets/image/Layar1.png",
              ),
              fit: BoxFit.cover,
              scale: 2,
            ),
          ),
        ),
      ),
    );
  }
}
