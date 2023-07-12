import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/utilities/colors.dart';
import 'package:image_picker/image_picker.dart';

import '../anggur/anggur_screen.dart';
import '../preview/preview_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? image;
  final ImagePicker picker = ImagePicker();

  Future getImageCam() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    setState(() {});
  }

  Future getImageGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: KhighlightTxtClr,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.home,
            color: KButtonClr,
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
                (route) => false);
          },
        ),
        centerTitle: true,
        title: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Image.asset(
              "assets/image/Logo1.png",
              width: size.width * 0.3,
            )
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AnggurScreen(),
                ),
              );
            },
            child: Image.asset(
              "assets/image/Logo4.png",
              width: size.width * 0.15,
              scale: size.height * 0.035,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              width: size.width,
              top: size.height * 0.05,
              child: Container(
                height: size.height,
                width: size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/image/Layar3a.png",
                    ),
                    scale: 0.5,
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.1,
              child: Image.asset(
                "assets/image/BuahAnggur.png",
              ),
            ),
            Positioned(
              width: size.width,
              bottom: size.height * 0.09,
              left: size.width * 0.06,
              child: Container(
                height: size.height,
                width: size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/image/Layar3b.png",
                    ),
                    scale: 0.9,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    const Spacer(),
                    const Text(
                      "Mulai mendeteksi dengan menambahkan gambar melalui galeri atau kamera",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await getImageCam();
                        if (image != null) {
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PreviewScreen(image: image),
                            ),
                          ).then(
                            (_) => {
                              setState(() {
                                image = null;
                              })
                            },
                          );
                        }
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
                        "Dari Kamera",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await getImageGallery();
                        if (image != null) {
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PreviewScreen(image: image),
                            ),
                          ).then(
                            (_) => {
                              setState(() {
                                image = null;
                              })
                            },
                          );
                        }
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
                        "Dari Galeri",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
