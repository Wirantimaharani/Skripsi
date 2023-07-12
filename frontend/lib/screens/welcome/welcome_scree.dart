import 'package:flutter/material.dart';
import 'package:frontend/utilities/colors.dart';

import '../home/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: KhighlightTxtClr,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              width: size.width,
              bottom: size.height * 0.49,
              child: Image.asset('assets/image/Layar2a.png'),
            ),
            Positioned(
              width: size.width * 0.7,
              bottom: size.height * 0.8,
              child: Image.asset('assets/image/Layar2c.png'),
            ),
            Positioned(
              width: size.width,
              bottom: size.height * -0.01,
              child: Image.asset('assets/image/Layar2b.png'),
            ),
            Positioned(
              height: size.height,
              top: size.height * 0.16,
              child: Image.asset('assets/image/BuahAnggur.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 35,
                right: 15,
                left: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                          (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: KButtonClr,
                      minimumSize: Size(size.width, 50),
                      shadowColor: Colors.grey,
                      elevation: 5,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Mulai",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
